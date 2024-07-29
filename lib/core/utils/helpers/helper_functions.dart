import 'dart:convert';

import 'package:flutter/material.dart';

class HelperFunctions {
  HelperFunctions._();

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static String getGreeting(TimeOfDay currentTime) {
    print('current tine: $currentTime');
    final hour = currentTime.hour;
    if (hour < 12) {
      return 'Good morning!';
    } else if (hour < 17) {
      return 'Good afternoon!';
    } else {
      return 'Good evening!';
    }
  }

//   String compressData(Map<String, dynamic> data) {
//   List<int> encodedData = utf8.encode(jsonEncode(data));
//   List<int> compressedData = GZipEncoder().encode(encodedData)!;
//   return base64Encode(compressedData);
// }
}
