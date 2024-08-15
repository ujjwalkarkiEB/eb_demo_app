import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/config/route/app_route.dart';
import 'package:eb_demo_app/src/features/chat/presentation/blocs/socket/socket_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../../../core/common/widgets/custom_shapes/container/circular_container.dart';
import '../../../../../../../core/utils/constants/images.dart';
import '../../../../data/model/user.dart';

class ActiveUsersList extends StatelessWidget {
  const ActiveUsersList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<User> activeUsers = [];
    return BlocBuilder<SocketBloc, SocketState>(
      builder: (context, state) {
        if (state is OnlineUsersState) {
          activeUsers = state.onlineUsers;
        }
        return activeUsers.isEmpty
            ? Text('No active users!')
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
                            context.read<SocketBloc>().add(
                                JoinPrivateChatRoom(userId: activeUser.id));
                            context.router.push(PrivateChatRoomRoute(
                                reciverID: activeUser.id,
                                receiverName: activeUser.userName));
                          },
                          child: Stack(children: [
                            CircleAvatar(
                              backgroundImage: activeUser.avatar ??
                                  AssetImage(AppImages.userImage),
                              radius: 30,
                            ),
                            Positioned(
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
                ),
              );
      },
    );
  }
}
