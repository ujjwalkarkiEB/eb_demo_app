import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/utils/constants/colors.dart';
import '../../../data/model/profile.dart';
import 'widgets/profile_card.dart';
import 'package:eb_demo_app/core/config/injection/injection.dart';
import 'package:eb_demo_app/src/features/personalization/presentation/bloc/personalization_bloc.dart';

@RoutePage()
class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    Profile userProfile;

    return BlocProvider(
      create: (context) =>
          getIt<PersonalizationBloc>()..add(ProfileFetchRequestEvent()),
      child: BlocBuilder<PersonalizationBloc, PersonalizationState>(
        builder: (context, state) {
          if (state is PersonalizationInitial || state is ProfileFetchLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProfileFetched) {
            userProfile = state.currentUser;
          }
          return Scaffold(
            appBar: AppBar(
              title: const Text('Account'),
              backgroundColor: AppColors.buttonColor,
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.exit_to_app,
                      color: Colors.white,
                      size: 30,
                    ))
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UserTile(
                      email: '',
                      name: '',
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
                      subtitle:
                          const Text('This sets app theme to use dark mode'),
                      trailing: Switch(
                        value: true,
                        onChanged: (value) {},
                      ),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.lock_outline,
                        size: 30,
                      ),
                      title: const Text('Enable MFA Mode'),
                      subtitle:
                          const Text('Enforce login process to use OTP code'),
                      trailing: Switch(
                        value: true,
                        onChanged: (value) {},
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
