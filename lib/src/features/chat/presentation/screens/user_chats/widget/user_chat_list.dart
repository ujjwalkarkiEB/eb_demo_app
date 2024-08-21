import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eb_demo_app/core/config/route/app_route.dart';
import 'package:eb_demo_app/core/utils/constants/images.dart';
import 'package:eb_demo_app/core/utils/helpers/helper_functions.dart';
import 'package:eb_demo_app/src/features/chat/data/model/chat.dart';
import 'package:eb_demo_app/src/features/chat/data/model/user.dart';
import 'package:eb_demo_app/src/features/chat/presentation/blocs/private_chat/private_chat_room_bloc.dart';
import 'package:eb_demo_app/src/features/chat/presentation/blocs/socket/socket_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class UserChatList extends StatefulWidget {
  const UserChatList({super.key});

  @override
  State<UserChatList> createState() => _UserChatListState();
}

class _UserChatListState extends State<UserChatList> {
  @override
  Widget build(BuildContext context) {
    final currentUserId = context.read<SocketBloc>().currentUserId;

    return BlocBuilder<SocketBloc, SocketState>(
      buildWhen: (previous, current) => current is UserChatsLoaded,
      builder: (context, state) {
        if (state is UserChatsLoaded) {
          return Expanded(
            child: ListView.separated(
              separatorBuilder: (_, __) => const Gap(10),
              itemCount: state.chats.length,
              itemBuilder: (context, index) {
                final chat = state.chats[index];

                final isSentByMe = chat.sender.id == currentUserId;
                final otherUser = isSentByMe ? chat.receiver : chat.sender;
                final formattedDateTime =
                    HelperFunctions.formatChatMessageTime(chat.createdAt);

                return BlocSelector<SocketBloc, SocketState, Chat?>(
                  selector: (state) {
                    if (state is NewMessageState &&
                        state.recievedChat.room == chat.room) {
                      return state.recievedChat;
                    }
                    return null;
                  },
                  builder: (context, updatedChat) {
                    return SenderChatWidget(
                      otherUser: otherUser,
                      isSentByMe: isSentByMe,
                      chat: updatedChat ?? chat,
                      formattedDateTime: formattedDateTime,
                    );
                  },
                );
              },
            ),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

class SenderChatWidget extends StatelessWidget {
  const SenderChatWidget({
    super.key,
    required this.otherUser,
    required this.isSentByMe,
    required this.chat,
    required this.formattedDateTime,
  });

  final User otherUser;
  final bool isSentByMe;
  final Chat chat;
  final String? formattedDateTime;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SocketBloc, SocketState>(
      builder: (context, state) {
        return ListTile(
          onTap: () {
            context
                .read<PrivateChatRoomBloc>()
                .add(JoinPrivateChatRoomEvent(userId: otherUser.id));
            context.router.push(PrivateChatRoomRoute(
              reciverID: otherUser.id,
              receiverName: otherUser.userName,
            ));
          },
          splashColor: const Color.fromARGB(255, 225, 240, 233),
          leading: CircleAvatar(
            backgroundImage: otherUser.avatar != null
                ? CachedNetworkImageProvider(otherUser.avatar!)
                : const AssetImage(AppImages.userImage) as ImageProvider,
            radius: 30,
          ),
          title: Text(otherUser.userName),
          subtitle: Text(
            isSentByMe ? 'You: ${chat.message}' : chat.message,
            style: TextStyle(
              color: !chat.isRead && !isSentByMe
                  ? Colors.black
                  : Colors.black.withOpacity(0.4),
              fontWeight: !chat.isRead && !isSentByMe
                  ? FontWeight.bold
                  : FontWeight.normal,
            ),
          ),
          trailing: Text(formattedDateTime ?? ''),
        );
      },
    );
  }
}
