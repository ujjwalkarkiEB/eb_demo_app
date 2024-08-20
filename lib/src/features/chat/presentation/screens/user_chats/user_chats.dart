import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/common/widgets/snackbars/error_snackbar.dart';
import 'package:eb_demo_app/core/utils/constants/colors.dart';
import 'package:eb_demo_app/core/utils/constants/sizes.dart';
import 'package:eb_demo_app/src/features/chat/data/dummydata/chats.dart';
import 'package:eb_demo_app/src/features/chat/data/dummydata/dummy_user.dart';
import 'package:eb_demo_app/src/features/chat/presentation/blocs/socket/socket_bloc.dart';
import 'package:eb_demo_app/src/features/chat/presentation/blocs/usersearch/usersearch_bloc.dart';
import 'package:eb_demo_app/src/features/chat/presentation/screens/user_chats/widget/active_userlist.dart';
import 'package:eb_demo_app/src/features/chat/presentation/screens/user_chats/widget/user_chat_list.dart';
import 'package:eb_demo_app/src/features/chat/presentation/screens/user_chats/widget/user_search_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

@RoutePage()
class UserChatsScreen extends StatefulWidget {
  const UserChatsScreen({super.key});

  @override
  State<UserChatsScreen> createState() => _UserChatsScreenState();
}

class _UserChatsScreenState extends State<UserChatsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SocketBloc>().add(GetLastMsgWithUsers());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SocketBloc, SocketState>(
      listener: (context, state) {
        if (state is UserChatsLoadingFailed) {
          showFlashError(context, 'Failed to load user chats!');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Chat Screen'),
          backgroundColor: AppColors.buttonColor,
        ),
        body: const Padding(
          padding: EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserSearchContainer(),
              Gap(AppSizes.spaceBetweenSections),
              Text('Active Users'),
              Gap(10),
              ActiveUsersList(),
              Gap(AppSizes.spaceBetweenSections),
              Text('Your Chats'),
              Gap(10),
              UserChatList()
            ],
          ),
        ),
      ),
    );
  }
}
