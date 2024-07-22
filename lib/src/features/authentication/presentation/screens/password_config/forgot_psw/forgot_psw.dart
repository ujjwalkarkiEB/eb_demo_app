import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/src/features/authentication/presentation/screens/password_config/widget/psw_config_form.dart';
import 'package:flutter/material.dart';
import '../../../../../../../core/config/route/app_route.dart';
import '../../../../../../../core/utils/validators/validation.dart';

@RoutePage()
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  String? email;

  void _recoverPassword() {
    context.router.push(const EmailVerificationRoute());

    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      // Handle the email recovery process here
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password recovery email sent to $email')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PasswordConfigWidget(
      screenTitle: 'Forgot Password',
      title: 'Mail Address Here',
      content: 'Enter the email address associated with your account',
      form: Form(
        key: _formKey,
        child: TextFormField(
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
      ),
      buttonTitle: 'Recover Password',
      onButtonPressed: _recoverPassword,
    );
  }
}
