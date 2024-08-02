import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/config/route/app_route.dart';
import 'package:eb_demo_app/src/features/authentication/presentation/blocs/login_bloc/login_bloc.dart';
import 'package:eb_demo_app/src/features/authentication/presentation/screens/signin/widgets/social_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eb_demo_app/core/utils/constants/sizes.dart';
import 'package:eb_demo_app/core/utils/validators/validation.dart';

import '../../../../../../../core/utils/constants/colors.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool rememberMe = false;

  void _submitForm() {
    // context.router.pushAndPopUntil(MainNavRoute(), predicate: (route) => false);
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      context.read<LoginBloc>().add(LoginRequestEvent(
            email: email!,
            password: password!,
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Email'),
            validator: (value) {
              return Validator.validateEmail(value!);
            },
            onSaved: (newValue) {
              if (newValue!.isNotEmpty) {
                email = newValue;
              }
            },
          ),
          const Gap(AppSizes.spaceBetweenInputFields),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Password'),
            validator: (value) {
              return Validator.validatePassword(value!);
            },
            onSaved: (newValue) {
              if (newValue!.isNotEmpty) {
                password = newValue;
              }
            },
          ),
          const Gap(AppSizes.spaceBetweenInputFields),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  //checkbox
                  Checkbox(
                    value: rememberMe,
                    onChanged: (val) {
                      setState(() {
                        rememberMe = val!;
                      });
                    },
                  ),
                  const Text('Remember Me'),
                ],
              ),
              GestureDetector(
                onTap: () {
                  context.router.push(ForgotPasswordRoute());
                },
                child: const Text('Forgot Password?'),
              ),
            ],
          ),
          // login button
          SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _submitForm,
              style: OutlinedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
              child: BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is LoginLoading) {
                    return const CupertinoActivityIndicator(
                      color: Colors.white,
                    );
                  }
                  return const Text(
                    'Login',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  );
                },
              ),
            ),
          ),
          const Gap(10),

          const SocialButton(),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Don\'t have an account?'),
              TextButton(
                onPressed: () {
                  context.read<LoginBloc>().add(ReDirectToSignupScreenEvent());
                },
                child: const Text(
                  'SIGN UP',
                  style: TextStyle(
                      color: AppColors.customContainerColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
