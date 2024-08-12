import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/config/route/app_route.dart';
import 'package:eb_demo_app/core/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../../../../../../../core/config/injection/injection.dart';
import '../../../../../../../core/utils/constants/images.dart';
import '../../../../../authentication/data/data_source/local/auth_database_service.dart';
import '../../../../data/model/chat.dart';
import '../../../blocs/socket/socket_bloc.dart';

class UserChatList extends StatelessWidget {
  const UserChatList({
    super.key,
    required this.chatLists,
  });

  final List<Chat> chatLists;

  @override
  Widget build(BuildContext context) {
    final currentUserId = getIt<AuthDatabaseService>().getUserId();

    List<Chat> userChats = [];
    return BlocBuilder<SocketBloc, SocketState>(
      builder: (context, state) {
        if (state is UserChatsLoaded) {
          userChats = state.chats;
        }
        return Expanded(
          child: ListView.separated(
            separatorBuilder: (_, __) => const Gap(10),
            itemCount: userChats.length,
            itemBuilder: (context, index) {
              final chat = userChats[index];
              final formattedDateTime =
                  HelperFunctions.formatChatMessageTime(chat.createdAt);
              return ListTile(
                onTap: () {
                  context.read<SocketBloc>().add(
                        JoinPrivateChatRoom(
                            userId: chat.sender.id == currentUserId
                                ? chat.receiver.id
                                : chat.sender.id),
                      );
                  context.router.push(PrivateChatRoomRoute(
                      reciverID: chat.sender.id == currentUserId
                          ? chat.receiver.id
                          : chat.sender.id));
                },
                splashColor: const Color.fromARGB(255, 225, 240, 233),
                leading: CircleAvatar(
                  backgroundImage: chat.sender.id == currentUserId
                      ? (chat.receiver.avatar != null
                          ? NetworkImage(chat.receiver.avatar!)
                          : const AssetImage(AppImages.userImage))
                      : (chat.sender.avatar != null
                          ? NetworkImage(chat.sender.avatar!)
                          : const AssetImage(AppImages.userImage)),
                  radius: 30,
                ),
                title: Text(currentUserId == chat.sender.id
                    ? chat.receiver.userName
                    : chat.sender.userName),
                subtitle: Text(
                  chat.message,
                  style: TextStyle(
                    color: chat.isRead
                        ? Colors.black
                        : Colors.black.withOpacity(0.4),
                    fontWeight:
                        chat.isRead ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                trailing: Text(formattedDateTime ?? ''),
              );
            },
          ),
        );
      },
    );
  }
}
