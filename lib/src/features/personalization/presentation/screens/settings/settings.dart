import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/config/route/app_route.dart';
import 'package:eb_demo_app/core/global_bloc/session/session_bloc.dart';
import 'package:eb_demo_app/src/features/authentication/presentation/blocs/auth/auth_bloc.dart';
import 'package:eb_demo_app/src/features/authentication/presentation/blocs/login_bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/utils/constants/colors.dart';
import 'widgets/profile_card.dart';
import 'package:eb_demo_app/src/features/personalization/presentation/bloc/personalization_bloc.dart';

@RoutePage()
class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is LoggingOut) {
              EasyLoading.show(status: 'Logging out...');
            }
            if (state is LogOutSuccessful) {
              EasyLoading.dismiss();
              // context.read<SessionBloc>().add(StopListeningEvent());
              context.router.pushAndPopUntil(
                const SigninRoute(),
                predicate: (route) => false,
              );
            }
            if (state is LogOutFailed) {
              EasyLoading.dismiss();
              EasyLoading.showError('Failed logging out attempt!');
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Account'),
          backgroundColor: AppColors.buttonColor,
          actions: [
            IconButton(
              onPressed: () {
                context.read<AuthBloc>().add(AuthLogoutReuqestEvenet());
              },
              icon: const Icon(
                Icons.exit_to_app,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<PersonalizationBloc, PersonalizationState>(
                  buildWhen: (previous, current) => current is ProfileFetched,
                  builder: (context, state) {
                    if (state is PersonalizationInitial ||
                        state is ProfileFetchLoading) {
                      return const LinearProgressIndicator(
                        backgroundColor: Colors.green,
                        minHeight: 10,
                      );
                    }

                    if (state is ProfileFetched) {
                      return const UserTile();
                    }

                    if (state is ProfileFetchingError) {
                      return const Center(
                        child: Text('Failed to load profile!'),
                      );
                    }

                    return const SizedBox();
                  },
                ),
                const Gap(20),
                const Text('App Settings'),
                const Gap(20),
                ListTile(
                  leading: const Icon(
                    Icons.dark_mode_outlined,
                    size: 30,
                  ),
                  title: const Text('Enable Dark Mode'),
                  subtitle: const Text('This sets app theme to use dark mode'),
                  trailing: Switch(
                    value: true,
                    onChanged: (value) {},
                  ),
                ),
                BlocBuilder<AuthBloc, AuthState>(
                  buildWhen: (previous, current) =>
                      current is BiometricDisabled ||
                      current is BiometricDisabled ||
                      current is BiometricEnabled,
                  builder: (context, state) {
                    if (state is BiometricAvailable ||
                        (state is BiometricDisabled ||
                            state is BiometricEnabled)) {
                      return ListTile(
                        leading: const Icon(
                          Icons.lock_outline,
                          size: 30,
                        ),
                        title: const Text('Enable Biometrics'),
                        subtitle: const Text(
                            'Makes seamless login process ny using your biometrics'),
                        trailing: Switch(
                          value: context.read<AuthBloc>().isBiometricEnabled,
                          onChanged: (value) {
                            context
                                .read<AuthBloc>()
                                .add(ToggleBiometricLogin(enbale: value));
                          },
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
