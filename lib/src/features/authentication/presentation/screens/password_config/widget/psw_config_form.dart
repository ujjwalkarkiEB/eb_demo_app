import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/utils/constants/sizes.dart';
import 'package:eb_demo_app/src/features/authentication/presentation/blocs/password_reset/password_reset_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../../../core/utils/constants/colors.dart';

class PasswordConfigWidget extends StatelessWidget {
  const PasswordConfigWidget(
      {super.key,
      required this.screenTitle,
      required this.title,
      required this.content,
      required this.form,
      required this.buttonTitle,
      required this.onButtonPressed});
  final String screenTitle;
  final String title;
  final String content;
  final Widget form;
  final String buttonTitle;
  final VoidCallback onButtonPressed;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
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
                    IconButton(
                      onPressed: () {
                        context.router.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_outlined,
                      ),
                      color: Colors.white,
                    ),
                    Gap(screenSize.width * 0.18),
                    Text(
                      screenTitle,
                      style: const TextStyle(
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
              alignment: Alignment.center,
              padding: const EdgeInsets.all(40),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                  ),
                  color: Colors.white),
              child: Column(
                children: [
                  Gap(screenSize.height * 0.05),
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: const Color.fromARGB(255, 38, 89, 39)),
                  ),
                  const Gap(AppSizes.spaceBetweenInputFields),
                  Text(
                    content,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.3),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  const Gap(AppSizes.spaceBetweenInputFields),
                  form,
                  const Gap(AppSizes.spaceBetweenSections),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: onButtonPressed,
                          child: BlocBuilder<PasswordResetBloc,
                              PasswordResetState>(
                            builder: (context, state) {
                              if (state is PasswordResetActionLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                );
                              }
                              return Text(buttonTitle);
                            },
                          )))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
