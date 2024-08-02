import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomFormTextField extends StatelessWidget {
  const CustomFormTextField({
    super.key,
    required this.label,
    this.maxLines,
    this.maxLength,
    required this.onSaved,
    this.validator,
    this.minLines,
    required this.keyboardType,
  });

  final String label;
  final int? maxLines;
  final int? maxLength;
  final int? minLines;
  final void Function(String?) onSaved;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const Gap(10),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextFormField(
            keyboardType: keyboardType,
            maxLines: maxLines,
            maxLength: maxLength,
            minLines: minLines,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
              counterText: '',
            ),
            onSaved: onSaved,
            validator: validator,
          ),
        ),
      ],
    );
  }
}
