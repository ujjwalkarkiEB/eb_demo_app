import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eb_demo_app/core/common/widgets/snackbars/error_snackbar.dart';
import 'package:eb_demo_app/core/config/route/app_route.dart';
import 'package:eb_demo_app/core/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../../../core/config/injection/injection.dart';
import '../../../../../../../core/global_bloc/global/global_bloc.dart';
import '../../../../../../../core/utils/constants/images.dart';
import '../../../../../authentication/data/data_source/local/auth_database_service.dart';
import '../../../../data/model/chat.dart';
import '../../../blocs/socket/socket_bloc.dart';

class UserChatList extends StatefulWidget {
  const UserChatList({
    super.key,
  });

  @override
  State<UserChatList> createState() => _UserChatListState();
}

class _UserChatListState extends State<UserChatList> {
  List<Chat> userLastChats = [];

  @override
  Widget build(BuildContext context) {
    final currentUserId = context.read<SocketBloc>().currentUserId;
    return MultiBlocListener(
      listeners: [
        BlocListener<SocketBloc, SocketState>(
          listener: (context, state) {
            if (state is UserChatsLoadingFailed) {
              showFlashError(context, 'Failed to load chatlist');
            }
          },
        ),
        BlocListener<GlobalBloc, GlobalStatusState>(
          listener: (context, state) {
            if (state is RefreshState &&
                state.refershType == RefreshType.chatList) {
              context.read<SocketBloc>().add(GetLastMsgWithUsers());
            }
          },
        ),
      ],
      child: BlocBuilder<SocketBloc, SocketState>(
        builder: (context, state) {
          if (state is UserChatsLoaded) {
            userLastChats = state.chats;
          }

          return Expanded(
            child: ListView.separated(
              separatorBuilder: (_, __) => const Gap(10),
              itemCount: userLastChats.length,
              itemBuilder: (context, index) {
                final chat = userLastChats[index];
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
                            : chat.sender.id,
                        receiverName: currentUserId == chat.sender.id
                            ? chat.receiver.userName
                            : chat.sender.userName));
                  },
                  splashColor: const Color.fromARGB(255, 225, 240, 233),
                  leading: CircleAvatar(
                    backgroundImage: chat.sender.id == currentUserId
                        ? (chat.receiver.avatar != null
                            ? CachedNetworkImageProvider(chat.receiver.avatar!)
                            : const AssetImage(AppImages.userImage))
                        : (chat.sender.avatar != null
                            ? CachedNetworkImageProvider(chat.sender.avatar!)
                            : const AssetImage(AppImages.userImage)),
                    radius: 30,
                  ),
                  title: Text(currentUserId == chat.sender.id
                      ? chat.receiver.userName
                      : chat.sender.userName),
                  subtitle: Text(
                    chat.message,
                    style: TextStyle(
                      color: chat.isRead && currentUserId == chat.receiver.id
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
      ),
    );
  }
}
