import 'package:eb_demo_app/core/utils/constants/colors.dart';
import 'package:eb_demo_app/core/utils/constants/sizes.dart';
import 'package:eb_demo_app/core/utils/validators/validation.dart';
import 'package:eb_demo_app/src/features/authentication/presentation/bloc/bloc/auth_bloc.dart';
import 'package:eb_demo_app/src/features/authentication/presentation/screens/signin/signin_screen.dart';
import 'package:eb_demo_app/src/features/authentication/presentation/screens/signup/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class AuthenticationForm extends StatefulWidget {
  const AuthenticationForm({super.key, this.isSignIn = true});
  final bool isSignIn;

  @override
  State<AuthenticationForm> createState() => _AuthenticationFormState();
}

class _AuthenticationFormState extends State<AuthenticationForm> {
  final formKey = GlobalKey<FormState>();
  String? username;
  String? email;
  String? enteredPassword;
  String? repeatedPsw;

  void onSubmit() {
    formKey.currentState!.save();

    if (formKey.currentState!.validate()) {
      if (widget.isSignIn) {
        if (email == null || enteredPassword == null) {
          return;
        }
        context.read<AuthBloc>().add(
            AuthSignInRequestEvent(email: email!, password: enteredPassword!));
      } else {
        if (email == null ||
            enteredPassword == null ||
            repeatedPsw == null ||
            username == null) {
          return;
        }
        context.read<AuthBloc>().add(AuthSignUpRequestEvent(
              email: email!,
              password: enteredPassword!,
              username: username!,
              repeatedPassword: repeatedPsw!,
            ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ----------- SIGNIN FORM -----------
            if (widget.isSignIn) ...[
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
                    enteredPassword = newValue;
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
                      Checkbox(value: false, onChanged: (val) {}),

                      const Text('Remember Me')
                    ],
                  ),
                  const Text('Forgot Password?')
                ],
              ),
            ],

            // ----------- SIGNUP FORM -----------
            if (!widget.isSignIn) ...[
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
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.password),
                  labelText: 'Password',
                ),
                validator: (value) {
                  return Validator.validatePassword(value);
                },
                onSaved: (newValue) {
                  if (newValue!.isNotEmpty) {
                    enteredPassword = newValue;
                  }
                },
              ),
              const Gap(40),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.password_outlined),
                  labelText: 'Repeat Password',
                ),
                validator: (value) {
                  return Validator.validateRepeatPassword(
                      repeatedPsw: value!, enteredPsw: enteredPassword);
                },
                onSaved: (newValue) {
                  if (newValue!.isNotEmpty) {
                    repeatedPsw = newValue;
                  }
                },
              ),
            ],
            const Gap(40),
            SizedBox(
              height: screenSize.height * 0.08,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onSubmit,
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonColor,
                    foregroundColor: Colors.amber.shade300,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
                child: BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is AuthSignInLoading) {
                      return const Center(
                          child: CupertinoActivityIndicator(
                        color: Colors.white,
                      ));
                    }
                    return Text(
                      widget.isSignIn ? 'Login' : 'Register',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    );
                  },
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.isSignIn
                    ? 'Don\'t have an account?'
                    : 'Already have an account?'),
                TextButton(
                  onPressed: () {
                    final screen = widget.isSignIn
                        ? const SignupScreen()
                        : const SigninScreen();
                    if (!widget.isSignIn) {
                      Navigator.of(context).pop();
                    } else {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => screen,
                      ));
                    }
                  },
                  child: Text(
                    widget.isSignIn ? 'SIGN UP' : 'LOG IN',
                    style: const TextStyle(
                        color: AppColors.customContainerColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
