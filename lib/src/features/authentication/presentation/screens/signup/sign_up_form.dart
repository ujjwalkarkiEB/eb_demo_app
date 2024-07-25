import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/config/route/app_route.dart';
import 'package:eb_demo_app/core/utils/constants/colors.dart';
import 'package:eb_demo_app/core/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eb_demo_app/src/features/authentication/presentation/blocs/signup_bloc/signup_bloc.dart';
import 'package:eb_demo_app/core/utils/validators/validation.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? username;
  String? email;
  String? enteredPassword;
  String? repeatedPsw;

  void _submitForm() {
    _formKey.currentState!.save();
    if (_formKey.currentState!.validate()) {
      context.read<SignupBloc>().add(SignUpRequestEvent(
          username: username!,
          email: email!,
          password: enteredPassword!,
          repeatedPassword: repeatedPsw!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // ---- username field --
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.verified_user),
              labelText: 'Username',
            ),
            validator: (value) {
              return Validator.validateEmptyText(
                  fieldName: 'Username', value: value);
            },
            onSaved: (newValue) {
              if (newValue!.isNotEmpty) {
                username = newValue;
              }
            },
          ),
          const Gap(40),
          // ---- email field --
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.email),
              labelText: 'Email Address',
            ),
            validator: (value) {
              return Validator.validateEmail(value);
            },
            onSaved: (newValue) {
              if (newValue!.isNotEmpty) {
                email = newValue;
              }
            },
          ),
          const Gap(40),
          // ---- password field --
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.password),
              labelText: 'Password',
            ),
            validator: (value) {
              return Validator.validatePassword(value);
            },
            onSaved: (newValue) {
              enteredPassword = newValue;
            },
          ),
          const Gap(40),
          // ---- repeat password field --
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.password_outlined),
              labelText: 'Repeat Password',
            ),
            onSaved: (newValue) {
              if (newValue!.isNotEmpty) {
                repeatedPsw = newValue;
              }
            },
            validator: (value) {
              print('entered psw inside vali: $enteredPassword');
              return Validator.validateRepeatPassword(
                  repeatedPsw: value!, enteredPsw: enteredPassword);
            },
          ),
          const Gap(AppSizes.spaceBetweenSections),

          SizedBox(
            height: 80,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonColor,
                  foregroundColor: Colors.amber.shade300,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
              child: BlocBuilder<SignupBloc, SignupState>(
                builder: (context, state) {
                  if (state is SignupLoading) {
                    return const CupertinoActivityIndicator(
                      color: Colors.white,
                    );
                  }
                  return const Text(
                    'Register',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  );
                },
              ),
            ),
          ),
          const Spacer(),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Already have an account?'),
              TextButton(
                onPressed: () {
                  context.router.push(const SigninRoute());
                },
                child: const Text(
                  'LOGIN',
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
