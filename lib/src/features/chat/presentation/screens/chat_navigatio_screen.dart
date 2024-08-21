import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/config/injection/injection.dart';
import 'package:eb_demo_app/core/config/route/app_route.dart';
import 'package:eb_demo_app/src/features/chat/presentation/blocs/usersearch/usersearch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/private_chat/private_chat_room_bloc.dart';

@RoutePage()
class ChatNavigatioScreen extends StatelessWidget {
  const ChatNavigatioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UsersearchBloc(),
        ),
        BlocProvider(
          create: (context) => getIt<PrivateChatRoomBloc>(),
        ),
      ],
      child: const AutoRouter(),
    );
  }
}
