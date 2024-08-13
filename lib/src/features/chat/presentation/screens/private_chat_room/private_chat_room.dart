import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/global_bloc/global/global_bloc.dart';
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
  List<Chat> privateMessages = [];

  @override
  void initState() {
    super.initState();
    context
        .read<SocketBloc>()
        .add(GetAllMessagesWithUser(userID: widget.reciverID));
  }

  @override
  void dispose() {
    msgController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(widget.receiverName),
      ),
      body: BlocBuilder<SocketBloc, SocketState>(
          buildWhen: (previous, current) =>
              current is PrivateMessageRecievedState ||
              current is UserPrivateChatsLoaded,
          builder: (context, state) {
            if (state is UserPrivateChatsLoaded) {
              privateMessages = state.chats;
            }
            if (state is PrivateMessageRecievedState) {
              privateMessages.add(state.newChat);
            }

            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10, left: 14, right: 14, bottom: 5),
                    child: ListView.separated(
                      reverse: true,
                      separatorBuilder: (context, index) => const Gap(20),
                      itemCount: privateMessages.length,
                      itemBuilder: (context, index) {
                        final sortedChats = privateMessages.reversed.toList();
                        final chat = sortedChats[index];
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
}
