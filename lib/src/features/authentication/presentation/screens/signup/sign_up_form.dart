import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/utils/validators/validation.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
              // username = newValue;
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
              // email = newValue;
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
              // enteredPassword = newValue;
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
            // return Validator.validateRepeatPassword(
            //     repeatedPsw: value!, enteredPsw: enteredPassword);
          },
          onSaved: (newValue) {
            if (newValue!.isNotEmpty) {
              // repeatedPsw = newValue;
            }
          },
        ),
      ],
    );
  }
}
