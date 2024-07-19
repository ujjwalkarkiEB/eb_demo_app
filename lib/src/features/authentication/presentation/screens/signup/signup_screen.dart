import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/common/widgets/forms/authentication_form.dart';
import 'package:eb_demo_app/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/config/route/app_route.dart';
import '../../bloc/bloc/auth_bloc.dart';

@RoutePage()
class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthRegistrationFailure) {
          context.router.push(const OtpRoute());
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Stack(
              children: [
                Container(
                  height: screenSize.height * 0.15,
                  width: double.infinity,
                  color: Colors.white,
                ),
                Container(
                  height: screenSize.height * 0.15,
                  width: double.infinity,
                  padding: EdgeInsets.only(
                      left: screenSize.width * 0.04,
                      top: screenSize.height * 0.05),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(60),
                      ),
                      color: AppColors.customContainerColor),
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.amber.shade400),
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.arrow_back_ios_outlined),
                        ),
                      ),
                      const Gap(10),
                      const Text(
                        'Create Account',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: screenSize.height * 0.85,
                width: double.infinity,
                color: AppColors.customContainerColor,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: screenSize.height * 0.85,
                  width: double.infinity,
                  padding: const EdgeInsets.all(40),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                      ),
                      color: Colors.white),
                  child: const AuthenticationForm(
                    isSignIn: false,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
