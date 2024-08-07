import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/common/widgets/snackbars/error_snackbar.dart';
import 'package:eb_demo_app/core/config/route/app_route.dart';
import 'package:eb_demo_app/src/features/authentication/presentation/blocs/password_reset/password_reset_bloc.dart';
import 'package:eb_demo_app/src/features/authentication/presentation/screens/password_config/widget/psw_config_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:quickalert/quickalert.dart';

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
    formKey.currentState!.save();

    if (formKey.currentState!.validate()) {
      context
          .read<PasswordResetBloc>()
          .add(ResetNewPasswordEvent(newPsw: enteredPassword!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PasswordResetBloc, PasswordResetState>(
      listener: (context, state) async {
        if (state is ResetPasswordSuccessful) {
          await QuickAlert.show(
            context: context,
            type: QuickAlertType.info,
            text: 'Password reset successful. Proceed to login !',
            width: 50,
          );
          if (!context.mounted) {
            return;
          }
          context.router.pushAndPopUntil(
            const SigninRoute(),
            predicate: (route) => false,
          );
        }

        if (state is ResetPasswordError) {
          showFlashError(context, 'Something went wrong!');
        }
      },
      child: PasswordConfigWidget(
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
                    labelText: 'New Password',
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
                    return Validator.validateRepeatPassword(
                        enteredPsw: enteredPassword!, repeatedPsw: value);
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
      ),
    );
  }
}
