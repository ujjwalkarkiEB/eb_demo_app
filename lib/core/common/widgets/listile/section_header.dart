import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader(
      {super.key,
      required this.title,
      this.onPressed,
      this.isViewAll = false,
      this.textColor,
      this.trailing});
  final String title;
  final Color? textColor;
  final bool isViewAll;
  final VoidCallback? onPressed;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        title,
        style: TextStyle(
          color: textColor ?? Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: isViewAll
          ? TextButton(
              onPressed: onPressed,
              child: const Text('View All'),
            )
          : trailing,
    );
  }
}
