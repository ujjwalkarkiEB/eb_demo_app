import 'package:eb_demo_app/core/config/injection/injection.dart';
import 'package:eb_demo_app/core/config/route/app_route.dart';
import 'package:eb_demo_app/core/config/theme/theme.dart';
import 'package:eb_demo_app/core/global_bloc/bloc/internet_bloc.dart';
import 'package:eb_demo_app/core/global_bloc/global/global_bloc.dart';
import 'package:eb_demo_app/core/global_bloc/session/session_bloc.dart';
import 'package:eb_demo_app/src/features/authentication/presentation/blocs/auth/auth_bloc.dart';
import 'package:eb_demo_app/src/features/authentication/presentation/blocs/otp/otp_bloc.dart';
import 'package:eb_demo_app/src/features/authentication/presentation/blocs/password_reset/password_reset_bloc.dart';
import 'package:eb_demo_app/src/features/chat/presentation/screens/private_chat_room/private_chat_room.dart';
import 'package:eb_demo_app/src/features/chat/presentation/screens/user_chats/user_chats.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'features/shop/presentation/blocs/cart/cart_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AuthBloc>()..add(AppStartedEvent()),
        ),
        BlocProvider(
          create: (context) => getIt<OtpBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<CartBloc>()..add(GetCartItemsCount()),
        ),
        BlocProvider(
          create: (context) => getIt<PasswordResetBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<SessionBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<InternetBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<GlobalBloc>(),
        ),
      ],
      child: MaterialApp.router(
        title: 'EBP DEMO APP',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        darkTheme: AppTheme.darkThemeData,
        theme: AppTheme.lightThemeData,
        routerConfig: AppRouter().config(),
        builder: EasyLoading.init(),
      ),
      // child: MaterialApp(
      //   title: 'EBP DEMO APP',
      //   debugShowCheckedModeBanner: false,
      //   themeMode: ThemeMode.system,
      //   darkTheme: AppTheme.darkThemeData,
      //   theme: AppTheme.lightThemeData,
      //   home: const PrivateChatRoomScreen(),
      // ),
    );
  }
}
