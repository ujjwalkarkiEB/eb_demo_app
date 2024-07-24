import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/config/route/app_route.dart';
import 'package:eb_demo_app/core/utils/constants/colors.dart';
import 'package:eb_demo_app/core/utils/constants/images.dart';
import 'package:eb_demo_app/src/features/authentication/presentation/blocs/login_bloc/login_bloc.dart';
import 'package:eb_demo_app/src/features/authentication/presentation/screens/signin/widgets/sigin_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginFailed) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMsg)));
          }
          if (state is ScreenRedirect) {
            context.router.push(const SignupRoute());
          }

          if (state is LoginSuccess) {
            context.router.push(const MainNavRoute());
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              children: [
                Stack(
                  children: [
                    Container(
                      height: screenSize.height * 0.3,
                      width: double.infinity,
                      decoration: const BoxDecoration(color: Colors.white),
                    ),
                    Container(
                      height: screenSize.height * 0.3,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(60),
                          ),
                          image: DecorationImage(
                              image: AssetImage(AppImages.loginBackgroundImg),
                              opacity: 0.1,
                              fit: BoxFit.cover),
                          color: AppColors.customContainerColor),
                    ),
                    Positioned(
                        bottom: 0,
                        left: 80,
                        child: Container(
                          height: screenSize.height * 0.25,
                          width: screenSize.height * 0.3,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                            image: DecorationImage(
                              image: AssetImage(AppImages.loginLogo),
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: screenSize.height * 0.7,
                    width: double.infinity,
                    color: AppColors.customContainerColor,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: screenSize.height * 0.7,
                    width: double.infinity,
                    padding: const EdgeInsets.all(40),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                        ),
                        color: Colors.white),
                    child: const SignInForm(),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
