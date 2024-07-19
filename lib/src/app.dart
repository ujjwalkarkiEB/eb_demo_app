import 'package:eb_demo_app/core/config/route/app_route.dart';
import 'package:eb_demo_app/core/config/theme/theme.dart';
import 'package:eb_demo_app/src/features/authentication/presentation/bloc/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/authentication/presentation/screens/onBoarding/onboarding_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp.router(
        title: 'EBP DEMO APP',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        darkTheme: AppTheme.darkThemeData,
        theme: AppTheme.lightThemeData,
        routerConfig: AppRouter().config(),
        // home: const OnboardingScreen(),
      ),
    );
  }
}
