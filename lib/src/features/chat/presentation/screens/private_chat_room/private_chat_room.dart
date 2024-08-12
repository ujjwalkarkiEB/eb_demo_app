import 'package:eb_demo_app/src/features/chat/presentation/screens/private_chat_room/widget/chat_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../blocs/socket/socket_bloc.dart';

class PrivateChatRoomScreen extends StatefulWidget {
  const PrivateChatRoomScreen({super.key, required this.reciverID});
  final String reciverID;

  @override
  State<PrivateChatRoomScreen> createState() => _PrivateChatRoomScreenState();
}

class _PrivateChatRoomScreenState extends State<PrivateChatRoomScreen> {
  @override
  void initState() {
    super.initState();
    print("called");
    context
        .read<SocketBloc>()
        .add(GetAllMessagesWithUser(userID: widget.reciverID));
  }

  final msgController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Bibek'),
      ),
      body: BlocBuilder<SocketBloc, SocketState>(
        buildWhen: (previous, current) =>
            current is PrivateMessageRecievedState,
        builder: (context, state) {
          if (state is PrivateMessageRecievedState) {
            final chats = state.privateMessages;
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 14, right: 14),
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const Gap(20),
                      itemCount: chats.length,
                      itemBuilder: (context, index) {
                        final chat = chats[index];
                        return ChatMessageWidget(chat: chat);
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
                              msgController.clear();
                            },
                            child: const Icon(
                              Icons.send,
                              color: Colors.green,
                            ),
                          ),
                          filled: true),
                    ),
                  ),
                ),
              ],
            );
          }
          return Center(child: Text('Loading...'));
        },
      ),
    );
  }
}
