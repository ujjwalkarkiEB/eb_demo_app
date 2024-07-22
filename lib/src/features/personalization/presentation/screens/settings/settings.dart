import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/utils/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/utils/constants/colors.dart';
import 'widgets/profile_card.dart';

@RoutePage()
class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        backgroundColor: AppColors.buttonColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserTile(),
              Gap(20),
              Text('App Settings'),
              Gap(20),
              ListTile(
                leading: Icon(
                  Icons.dark_mode_outlined,
                  size: 30,
                ),
                title: Text('Enable Dark Mode'),
                subtitle: Text('This set app theme to used darkmode'),
                trailing: Switch(
                  value: true,
                  onChanged: (value) {},
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.lock_outline,
                  size: 30,
                ),
                title: Text('Enable MFA Mode'),
                subtitle: Text('Enforce login process to use OTP code'),
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
  }
}
