import 'package:flutter/material.dart';

Future<void> showSuccessSnackbar(
    BuildContext context, String text, VoidCallback onPressed) async {
  final snackBar = SnackBar(
    content: Text(text),
    backgroundColor: Colors.green,
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 3),
    action: SnackBarAction(
      label: 'OK',
      textColor: Colors.white,
      onPressed: onPressed,
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
