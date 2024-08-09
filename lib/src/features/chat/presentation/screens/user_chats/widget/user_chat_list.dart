import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/config/route/app_route.dart';
import 'package:eb_demo_app/core/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../../core/utils/constants/images.dart';
import '../../../../data/model/chat.dart';

class UserChatList extends StatelessWidget {
  const UserChatList({
    super.key,
    required this.chatLists,
  });

  final List<Chat> chatLists;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (_, __) => Gap(10),
        itemCount: chatLists.length,
        itemBuilder: (context, index) {
          final chat = chatLists[index];
          final formattedDateTime =
              HelperFunctions.formatChatMessageTime(chat.createdAt);
          return ListTile(
            onTap: () => context.router.push(PrivateChatRoomRoute()),
            splashColor: Color.fromARGB(255, 225, 240, 233),
            leading: CircleAvatar(
              backgroundImage: AssetImage(AppImages.userImage),
              radius: 30,
            ),
            title: Text(chat.sender.userName),
            subtitle: Text(
              chat.message,
              style: TextStyle(
                color:
                    chat.isRead ? Colors.black : Colors.black.withOpacity(0.4),
                fontWeight: chat.isRead ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            trailing: Text(formattedDateTime ?? ''),
          );
        },
      ),
    );
  }
}
