import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

Future<void> showSuccessSnackbar(BuildContext context, String text,
    {VoidCallback? onPressed}) async {
  final snackBar = SnackBar(
    content: SizedBox(
      height: 30,
      child: Row(
        children: [
          const Icon(Icons.done_all_rounded, color: Colors.white),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    ),
    backgroundColor: Colors.green,
    duration: const Duration(seconds: 3),
    action: SnackBarAction(
      label: 'Dismiss',
      textColor: Colors.green,
      backgroundColor: Colors.white,
      onPressed: onPressed ??
          () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
    ),
  );
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
