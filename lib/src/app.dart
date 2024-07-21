import 'package:eb_demo_app/core/config/route/app_route.dart';
import 'package:eb_demo_app/core/config/theme/theme.dart';
import 'package:eb_demo_app/src/features/authentication/presentation/blocs/login_bloc/login_bloc.dart';
import 'package:eb_demo_app/src/features/authentication/presentation/screens/signin/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/authentication/presentation/screens/onBoarding/onboarding_screen.dart';
import 'features/authentication/presentation/screens/signup/signup_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      // child: MaterialApp.router(
      //   title: 'EBP DEMO APP',
      //   debugShowCheckedModeBanner: false,
      //   themeMode: ThemeMode.system,
      //   darkTheme: AppTheme.darkThemeData,
      //   theme: AppTheme.lightThemeData,
      //   routerConfig: AppRouter().config(),
      //   // home: const OnboardingScreen(),
      // ),
      child: MaterialApp(
        title: 'EBP DEMO APP',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        darkTheme: AppTheme.darkThemeData,
        theme: AppTheme.lightThemeData,
        home: SignupScreen(),
        // home: const OnboardingScreen(),
      ),
    );
  }
}
