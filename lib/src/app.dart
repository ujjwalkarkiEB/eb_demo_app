import 'package:eb_demo_app/core/config/route/app_route.dart';
import 'package:eb_demo_app/core/config/theme/theme.dart';
import 'package:eb_demo_app/src/features/authentication/presentation/blocs/login_bloc/login_bloc.dart';
import 'package:eb_demo_app/src/features/authentication/presentation/screens/password_config/email_verification/email_verification.dart';
import 'package:eb_demo_app/src/features/authentication/presentation/screens/password_config/forgot_psw/forgot_psw.dart';
import 'package:eb_demo_app/src/features/authentication/presentation/screens/password_config/reset_password/rest_password.dart';
import 'package:eb_demo_app/src/features/authentication/presentation/screens/password_config/widget/psw_config_form.dart';
import 'package:eb_demo_app/src/features/authentication/presentation/screens/signin/signin_screen.dart';
import 'package:eb_demo_app/src/features/personalization/presentation/screens/profile/profile.dart';
import 'package:eb_demo_app/src/features/shop/presentation/screens/homenav/cart/cart.dart';
import 'package:eb_demo_app/src/features/shop/presentation/screens/homenav/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: MaterialApp.router(
        title: 'EBP DEMO APP',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        darkTheme: AppTheme.darkThemeData,
        theme: AppTheme.lightThemeData,
        routerConfig: AppRouter().config(),
      ),
      // child: MaterialApp(
      //   title: 'EBP DEMO APP',
      //   debugShowCheckedModeBanner: false,
      //   themeMode: ThemeMode.system,
      //   darkTheme: AppTheme.darkThemeData,
      //   theme: AppTheme.lightThemeData,
      //   home: const SigninScreen(),
      // ),
    );
  }
}
