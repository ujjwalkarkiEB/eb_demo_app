import 'package:eb_demo_app/core/config/injection/injection.dart';
import 'package:eb_demo_app/core/utils/constants/images.dart';
import 'package:eb_demo_app/src/features/authentication/data/data_source/local/auth_database_service.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:gap/gap.dart';

import '../../../../data/model/chat.dart';

class ChatMessageWidget extends StatelessWidget {
  final Chat chat;
  final bool isLatestMsg;

  ChatMessageWidget({required this.chat, required this.isLatestMsg});

  @override
  Widget build(BuildContext context) {
    final currentUserId = getIt<AuthDatabaseService>().getUserId();
    final isSender = chat.sender.id == currentUserId;
    final textColor = isSender ? Colors.white : Colors.black;
    final messageAlignment =
        isSender ? MainAxisAlignment.end : MainAxisAlignment.start;

    return Row(
      mainAxisAlignment: messageAlignment,
      children: [
        if (!isSender) ...[
          CircleAvatar(
            backgroundImage: chat.sender.avatar != null
                ? CachedNetworkImageProvider(chat.sender.avatar!)
                : const AssetImage(AppImages.userImage),
            radius: 20.0,
          ),
          const Gap(10),
          Text(
            chat.message,
            style: TextStyle(color: textColor),
          ),
        ],
        if (isSender)
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 50,
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Text(
                  chat.message,
                  style: TextStyle(color: textColor),
                ),
              ),
              const Gap(5),
              if (chat.isRead && isLatestMsg)
                const CircleAvatar(
                  radius: 10,
                  backgroundImage: AssetImage(AppImages.userImage),
                )
            ],
          ),
      ],
    );
  }
}
