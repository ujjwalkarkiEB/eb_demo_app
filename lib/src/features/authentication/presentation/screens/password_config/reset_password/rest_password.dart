import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/src/features/authentication/presentation/screens/password_config/widget/psw_config_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../../core/utils/validators/validation.dart';

@RoutePage()
class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  String? enteredPassword;
  String? repeatedPsw;

  void _onSubmit() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PasswordConfigWidget(
      screenTitle: 'Reset Password',
      title: 'Enter New Password',
      content: 'Your new password must be different from previously used',
      buttonTitle: 'Continue',
      form: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Password',
                ),
                validator: (value) {
                  return Validator.validateEmptyText(
                      fieldName: 'Password', value: value);
                },
                onSaved: (newValue) {
                  if (newValue!.isNotEmpty) {
                    enteredPassword = newValue;
                  }
                },
              ),
              const Gap(20),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Confirm Password',
                ),
                validator: (value) {
                  return Validator.validateEmptyText(
                      fieldName: 'Confirmed Password', value: value);
                },
                onSaved: (newValue) {
                  if (newValue!.isNotEmpty) {
                    enteredPassword = newValue;
                  }
                },
              ),
            ],
          )),
      onButtonPressed: _onSubmit,
    );
  }
}
