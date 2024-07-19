import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/utils/constants/images.dart';
import 'package:eb_demo_app/core/utils/constants/sizes.dart';
import 'package:eb_demo_app/core/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';

@RoutePage()
class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = HelperFunctions.isDarkMode(context);
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(133, 237, 92, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Your OTP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.green),
                child: Image.asset(
                  AppImages.otpLogo,
                  fit: BoxFit.cover,
                ),
              ),
              const Gap(AppSizes.spaceBetweenSections),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'We Have Sent OTP number Via Email',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(color: Colors.black.withOpacity(0.8)),
                  ),
                  const Gap(AppSizes.spaceBetweenInputFields),
                  Pinput(
                    length: 4,
                    defaultPinTheme: defaultPinTheme,
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: true,
                    onCompleted: (pin) => log(pin),
                  ),
                  const Gap(AppSizes.spaceBetweenSections),
                  const Text.rich(TextSpan(children: [
                    TextSpan(text: 'Didn\'t Recieve an OTP?'),
                    TextSpan(
                        text: 'Resend',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        )),
                  ])),
                ],
              ),
              const Gap(AppSizes.spaceBetweenSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Verify And Coninue',
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
