import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../../core/utils/validators/validation.dart';

class SiginInForm extends StatelessWidget {
  const SiginInForm({super.key, this.onSaved});
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
            decoration: const InputDecoration(labelText: 'Email'),
            validator: (value) {
              return Validator.validateEmail(value!);
            },
            onSaved: onSaved),
        const Gap(AppSizes.spaceBetweenInputFields),
        TextFormField(
            decoration: const InputDecoration(labelText: 'Password'),
            validator: (value) {
              return Validator.validatePassword(value!);
            },
            onSaved: onSaved),
        const Gap(AppSizes.spaceBetweenInputFields),
        Row(
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
    );
  }
}
