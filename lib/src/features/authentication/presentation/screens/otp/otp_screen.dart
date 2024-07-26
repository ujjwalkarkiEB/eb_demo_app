import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/common/widgets/snackbars/error_snackbar.dart';
import 'package:eb_demo_app/core/common/widgets/snackbars/sucess_snackbar.dart';
import 'package:eb_demo_app/core/config/injection/injection.dart';
import 'package:eb_demo_app/core/config/route/app_route.dart';
import 'package:eb_demo_app/core/utils/constants/images.dart';
import 'package:eb_demo_app/core/utils/constants/sizes.dart';
import 'package:eb_demo_app/core/utils/helpers/helper_functions.dart';
import 'package:eb_demo_app/src/features/authentication/presentation/blocs/otp/otp_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';

@RoutePage()
class OtpScreen extends StatelessWidget {
  const OtpScreen(
      {super.key, required this.userID, this.isRedirectedFromLogin = false});
  final String userID;
  final bool isRedirectedFromLogin;

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

    return BlocListener<OtpBloc, OtpState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is OtpCheckSuccess) {
          context.router.replace(const SigninRoute());
        }

        if (state is OtpCheckFailed) {
          showFlashError(context, state.failureMsg);
        }
        if (state is OtpResendFailed) {
          print('errorstae');
          showFlashError(context, 'Unknown Error. Wait for few minutes!');
        }
        if (state is OtpResendSuccess) {
          showSuccessSnackbar(context, 'Otp is sent successfully!', () {});
        }
      },
      child: Scaffold(
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
                    Center(
                      child: Text(
                        'We Have Sent OTP number Via Email',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: Colors.black.withOpacity(0.8)),
                      ),
                    ),
                    const Gap(AppSizes.spaceBetweenInputFields),
                    Pinput(
                      length: 6,
                      defaultPinTheme: defaultPinTheme,
                      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                      showCursor: true,
                      keyboardType: TextInputType.number,
                      onCompleted: (pin) {
                        context.read<OtpBloc>().add(AddDataOnCompleteInputEvent(
                            otpCode: pin, userID: userID));
                      },
                    ),
                    const Gap(AppSizes.spaceBetweenSections),
                    Center(
                        child: Row(
                      children: [
                        const Text('Didn\'t recieve any OTP'),
                        const Gap(10),
                        TextButton(
                          onPressed: () {
                            context
                                .read<OtpBloc>()
                                .add(ResendOtpRequestEvent(userID: userID));
                          },
                          child: const Text('Resend'),
                        ),
                      ],
                    )),
                  ],
                ),
                const Gap(AppSizes.spaceBetweenSections),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () {
                    context.read<OtpBloc>().add(OtpCheckEvent(
                        isRedirectedFromLogin: isRedirectedFromLogin));
                  }, child: BlocBuilder<OtpBloc, OtpState>(
                    builder: (context, state) {
                      if (state is OtpCheckLoading) {
                        return const Center(
                            child: CupertinoActivityIndicator());
                      }
                      return const Text(
                        'Verify And Continue',
                      );
                    },
                  )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
