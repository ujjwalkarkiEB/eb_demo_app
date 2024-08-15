import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/config/route/app_route.dart';
import 'package:eb_demo_app/src/features/authentication/presentation/blocs/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          // context.read<SessionBloc>().add(StartListeningEvent());
          context.router.replace(const MainNavRoute());
        }

        if (state is AuthUnAuthenticated) {
          context.router.replace(const SigninRoute());
        }

        if (state is FirstVisit) {
          context.router.replace(const OnboardingRoute());
        }
      },
      builder: (context, state) {
        if (state is CheckLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
