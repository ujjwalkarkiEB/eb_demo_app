import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/config/route/app_route.dart';
import 'package:eb_demo_app/src/features/authentication/presentation/screens/password_config/widget/psw_config_form.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';

@RoutePage()
class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
    return PasswordConfigWidget(
      screenTitle: 'Email Verification',
      title: 'Get Your Code',
      content: 'Please enter the 4 digit code sent to your email address',
      buttonTitle: 'Verify and Proceed',
      form: Column(
        children: [
          Pinput(
            length: 4,
            defaultPinTheme: defaultPinTheme,
            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            showCursor: true,
            onCompleted: (pin) => log(pin),
          ),
          const Gap(10),
          Row(
            children: [
              Text('Didn\'t recieve code?'),
              TextButton(onPressed: () {}, child: Text('Resend'))
            ],
          )
        ],
      ),
      onButtonPressed: () {
        context.router.push(const ResetPasswordRoute());
      },
    );
  }
}
