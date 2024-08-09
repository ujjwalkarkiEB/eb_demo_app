import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/utils/constants/colors.dart';
import 'package:eb_demo_app/core/utils/constants/sizes.dart';
import 'package:eb_demo_app/src/features/chat/data/dummydata/chats.dart';
import 'package:eb_demo_app/src/features/chat/data/dummydata/dummy_user.dart';
import 'package:eb_demo_app/src/features/chat/presentation/screens/user_chats/widget/active_userlist.dart';
import 'package:eb_demo_app/src/features/chat/presentation/screens/user_chats/widget/user_chat_list.dart';
import 'package:eb_demo_app/src/features/chat/presentation/screens/user_chats/widget/user_search_container.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

@RoutePage()
class UserChatsScreen extends StatelessWidget {
  const UserChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Screen'),
        backgroundColor: AppColors.buttonColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const UserSearchContainer(),
            const Gap(AppSizes.spaceBetweenSections),
            const Text('Active Users'),
            const Gap(10),
            const ActiveUsersList(
              activeUsers: dummyUsers,
            ),
            const Gap(AppSizes.spaceBetweenSections),
            const Text('Your Chats'),
            const Gap(10),
            UserChatList(
              chatLists: dummyChats,
            )
          ],
        ),
      ),
    );
  }
}
