import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/src/features/chat/presentation/blocs/usersearch/usersearch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ChatNavigatioScreen extends StatelessWidget {
  const ChatNavigatioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersearchBloc(),
      child: const AutoRouter(),
    );
  }
}
