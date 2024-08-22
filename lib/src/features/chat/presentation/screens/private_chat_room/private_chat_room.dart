import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/config/injection/injection.dart';
import 'package:eb_demo_app/core/global_bloc/global/global_bloc.dart';
import 'package:eb_demo_app/core/utils/socket/socket_client_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_debouncer/flutter_debouncer.dart';
import 'package:gap/gap.dart';
import '../../../../../../core/config/route/app_route.dart';
import '../../../../authentication/data/data_source/local/auth_database_service.dart';
import '../../../data/model/chat.dart';
import '../../blocs/private_chat/private_chat_room_bloc.dart';
import 'widget/chat_message.dart';

@RoutePage()
class PrivateChatRoomScreen extends StatefulWidget {
  const PrivateChatRoomScreen(
      {super.key, required this.reciverID, required this.receiverName});
  final String reciverID;
  final String receiverName;

  @override
  State<PrivateChatRoomScreen> createState() => _PrivateChatRoomScreenState();
}

class _PrivateChatRoomScreenState extends State<PrivateChatRoomScreen> {
  final msgController = TextEditingController();
  late final String? _currentUserId;

  @override
  void initState() {
    super.initState();

    _currentUserId = getIt<AuthDatabaseService>().getUserId();
    context
        .read<PrivateChatRoomBloc>()
        .add(FetchPrivateChatsEvent(senderId: widget.reciverID));
  }

  @override
  void dispose() {
    msgController.dispose();
    getIt<SocketClientManager>().leavePrivateChatRoom(_currentUserId!);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        // leading: IconButton(
        //     onPressed: () {
        //       context.router.back();
        //     },
        //     icon: const Icon(Icons.arrow_back_ios)),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.receiverName),
            StreamBuilder<bool>(
                stream: getIt<SocketClientManager>().typingEventStream,
                builder: (context, snapshot) {
                  if (snapshot.data == true) {
                    return Text(
                      '${widget.receiverName} is typing...',
                      style: const TextStyle(fontSize: 12),
                    );
                  }
                  return const SizedBox();
                }),
          ],
        ),
      ),
      body: BlocBuilder<PrivateChatRoomBloc, PrivateChatRoomState>(
          buildWhen: (previous, current) =>
              previous.chats.length != current.chats.length ||
              current.status != previous.status,
          builder: (context, state) {
            if (state.status == Status.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10, left: 14, right: 14, bottom: 5),
                    child: ListView.separated(
                      reverse: true,
                      separatorBuilder: (context, index) => const Gap(20),
                      itemCount: state.chats.length,
                      itemBuilder: (context, index) {
                        final sortedChats = state.chats.reversed.toList();
                        final chat = sortedChats[index];
                        if (state.chats.isEmpty) {
                          return const Center(
                            child: Text(
                                'No messages yet. Start the conversation!'),
                          );
                        }
                        return BlocSelector<PrivateChatRoomBloc,
                            PrivateChatRoomState, Chat?>(
                          selector: (state) {
                            if (state.status == Status.lastChatRead) {
                              log('herere');
                              final updatedChat = state.chats
                                  .where(
                                    (element) => element.id == chat.id,
                                  )
                                  .toList();
                              print(updatedChat[0]);
                              return updatedChat[0];
                            }
                            return null;
                          },
                          builder: (context, updatedChat) {
                            log('found updae chat: ${updatedChat?.isRead}');
                            return ChatMessageWidget(
                              chat: updatedChat ?? chat,
                              isLatestMsg: index == 0,
                              currentUserID: _currentUserId!,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child: TextField(
                      controller: msgController,
                      onChanged: (value) {
                        sendTypingEvents(value);
                      },
                      decoration: InputDecoration(
                        labelText: 'Send message...',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        fillColor: Colors.white,
                        enabled: true,
                        suffixIcon: InkWell(
                          onTap: () {
                            onSendMessage(context);
                          },
                          child: const Icon(
                            Icons.send,
                            color: Colors.green,
                          ),
                        ),
                        filled: true,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }

  void sendTypingEvents(String value) {
    final throttler = Throttler();
    const duration = Duration(seconds: 2);
    throttler.throttle(
      duration: duration,
      onThrottle: () {
        if (value.trim().isEmpty) {
          getIt<SocketClientManager>()
              .sendTypingEvent(receiverId: widget.reciverID, isTyping: false);
        } else {
          getIt<SocketClientManager>()
              .sendTypingEvent(receiverId: widget.reciverID, isTyping: true);
        }
      },
    );
  }

  void onSendMessage(BuildContext context) {
    context.read<PrivateChatRoomBloc>().add(SendPrivateMsgEvent(
          senderId: _currentUserId!,
          receiverId: widget.reciverID,
          message: msgController.text.trim(),
        ));

    context.read<GlobalBloc>().add(RefreshDataEvent(RefreshType.chatList));
    msgController.clear();
    // Stop typing event when sending message
    getIt<SocketClientManager>()
        .sendTypingEvent(receiverId: widget.reciverID, isTyping: false);
  }
}
