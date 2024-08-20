import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eb_demo_app/core/config/injection/injection.dart';
import 'package:eb_demo_app/core/config/route/app_route.dart';
import 'package:eb_demo_app/core/utils/socket/socket_client_manager.dart';
import 'package:eb_demo_app/src/features/authentication/data/data_source/local/auth_database_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../../../core/common/widgets/custom_shapes/container/circular_container.dart';
import '../../../../../../../core/utils/constants/images.dart';
import '../../../../data/model/user.dart';
import '../../../blocs/private_chat/private_chat_room_bloc.dart';

class ActiveUsersList extends StatelessWidget {
  const ActiveUsersList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final currentUserId = getIt<AuthDatabaseService>().getUserId();
    return StreamBuilder<List<User>>(
        stream: getIt<SocketClientManager>().onlineUsersStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading...');
          }

          if (snapshot.hasError) {
            log('Error: ${snapshot.error}');
            return const Text('Error loading active users');
          }

          if (!snapshot.hasData) {
            return const Text('No active users');
          }

          List<User> activeUsers = snapshot.data!
              .where(
                (user) => user.id != currentUserId,
              )
              .toList();

          // Debug active users list
          log('Active users: $activeUsers');

          return activeUsers.isEmpty
              ? const Center(
                  child: Text('No active users!'),
                )
              : SizedBox(
                  height: 85,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => const Gap(10),
                    itemCount: activeUsers.length,
                    itemBuilder: (context, index) {
                      final activeUser = activeUsers[index];
                      return Column(
                        children: [
                          // user image with active mark
                          GestureDetector(
                            onTap: () {
                              context.read<PrivateChatRoomBloc>().add(
                                  JoinPrivateChatRoomEvent(
                                      userId: activeUser.id));
                              context.router.push(PrivateChatRoomRoute(
                                  reciverID: activeUser.id,
                                  receiverName: activeUser.userName));
                            },
                            child: Stack(children: [
                              CircleAvatar(
                                backgroundImage: activeUser.avatar != null
                                    ? CachedNetworkImageProvider(
                                        activeUser.avatar)
                                    : const AssetImage(AppImages.userImage),
                                radius: 30,
                              ),
                              const Positioned(
                                right: 2,
                                bottom: 1,
                                child: CircularContainer(
                                  backgroundColor: Colors.green,
                                  height: 15,
                                  width: 15,
                                ),
                              )
                            ]),
                          ),
                          Gap(5),
                          // user name
                          Text(activeUser.userName)
                        ],
                      );
                    },
                  ));
        });
  }
}
