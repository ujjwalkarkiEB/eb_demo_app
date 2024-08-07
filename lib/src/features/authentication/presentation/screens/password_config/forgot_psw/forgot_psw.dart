import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/common/widgets/snackbars/error_snackbar.dart';
import 'package:eb_demo_app/src/features/authentication/presentation/screens/password_config/widget/psw_config_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/quickalert.dart';
import '../../../../../../../core/config/route/app_route.dart';
import '../../../../../../../core/utils/validators/validation.dart';
import '../../../blocs/password_reset/password_reset_bloc.dart';

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
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      if (email == null) {
        return;
      }
      context
          .read<PasswordResetBloc>()
          .add(ResetPswEmailSentEvent(email: email!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PasswordResetBloc, PasswordResetState>(
      listener: (context, state) async {
        if (state is PasswordResetEmailSent) {
          await QuickAlert.show(
            context: context,
            type: QuickAlertType.info,
            text: 'OTP is sent to your mail. First verify it!',
            width: 50,
          );
          if (!context.mounted) {
            return;
          }
          context.router.push(EmailVerificationRoute());
        }
        if (state is ResetPswEmailSendError) {
          showFlashError(context, state.errMsg);
        }
      },
      child: PasswordConfigWidget(
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
      ),
    );
  }
}
