import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/config/route/app_route.dart';
import 'package:eb_demo_app/core/utils/constants/colors.dart';
import 'package:eb_demo_app/src/features/authentication/presentation/blocs/signup_bloc/signup_bloc.dart';
import 'package:eb_demo_app/src/features/authentication/presentation/screens/signup/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:quickalert/quickalert.dart';

import '../../../../../../core/config/injection/injection.dart';

@RoutePage()
class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    // print(' 123 :  ${getIt<AppRouter>().currentChild?.name}');
    // print(' 1234 :  ${getIt<AppRouter>().stackData.first.name}');
    // print(' 1235 :  ${getIt<AppRouter>().root.}');
    return BlocProvider(
      create: (context) => getIt<SignupBloc>(),
      child: BlocListener<SignupBloc, SignupState>(
        listener: (context, state) async {
          if (state is SignupSuccess) {
            await QuickAlert.show(
              context: context,
              type: QuickAlertType.info,
              text: 'Registered Successfully! Proceed to verify email',
              width: 50,
            );
            context.router.push(OtpRoute(userID: state.userID));
          }
          if (state is SignupFailed) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMsg)));
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
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
                              context.router.popAndPush(const SigninRoute());
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
                  child: const SignUpForm(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
