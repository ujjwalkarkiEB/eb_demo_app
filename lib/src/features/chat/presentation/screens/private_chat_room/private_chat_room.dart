import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/config/injection/injection.dart';
import 'package:eb_demo_app/core/global_bloc/global/global_bloc.dart';
import 'package:eb_demo_app/core/utils/socket/socket_client_manager.dart';
import 'package:eb_demo_app/src/features/chat/presentation/blocs/bloc/private_chat_room_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../data/model/chat.dart';
import '../../blocs/socket/socket_bloc.dart';
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
  List<Chat> _privateChats = [];

  @override
  void dispose() {
    msgController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PrivateChatRoomBloc>()
        ..add(FetchPrivateChatsEvent(senderId: widget.reciverID)),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
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
            builder: (context, state) {
          if (state is PrivateChatsLoaded) {
            _privateChats = state.chats;
          }
          if (state is NewPrivateChatRecievedState) {
            _privateChats = state.newChats;
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
                    itemCount: _privateChats.length,
                    itemBuilder: (context, index) {
                      final chat = _privateChats[index];
                      return ChatMessageWidget(
                        chat: chat,
                        isLatestMsg: index == 0,
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
                      if (value.trim().isEmpty) {
                        getIt<SocketClientManager>().sendTypingEvent(
                            recieverId: widget.reciverID, isTyping: false);
                      } else {
                        getIt<SocketClientManager>().sendTypingEvent(
                            recieverId: widget.reciverID, isTyping: true);
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Send message...',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      fillColor: Colors.white,
                      enabled: true,
                      suffixIcon: InkWell(
                        onTap: () {
                          context.read<SocketBloc>().add(SendPrivateMsg(
                                receiverId: widget.reciverID,
                                message: msgController.text.trim(),
                              ));

                          context
                              .read<GlobalBloc>()
                              .add(RefreshDataEvent(RefreshType.chatList));
                          msgController.clear();
                          // Stop typing event when sending message
                          getIt<SocketClientManager>().sendTypingEvent(
                              recieverId: widget.reciverID, isTyping: false);
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
      ),
    );
  }
}
