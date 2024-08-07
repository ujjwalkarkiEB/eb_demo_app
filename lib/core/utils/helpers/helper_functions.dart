import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

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
  static Uint8List getEncryptionKey() {
    // Generate a 256-bit key using SHA-256 hash algorithm
    final key = utf8.encode('your-secure-key-here');
    final hash = sha256.convert(key);
    return Uint8List.fromList(hash.bytes);
  }
}
