import 'dart:convert';
import 'dart:developer';

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

  static String? formatChatMessageTime(String time) {
    final formatedChatDateTime = DateTime.tryParse(time);
    if (formatedChatDateTime == null) {
      log('Failed to parse cha msg time');
      return null;
    }
    final now = DateTime.now();
    final timeDifference = now.difference(formatedChatDateTime);

    if (timeDifference.inDays >= 1) {
      return '${timeDifference.inDays} ${timeDifference.inDays == 1 ? 'day ago' : 'days ago'}';
    } else if (timeDifference.inHours >= 1) {
      return '${timeDifference.inHours} ${timeDifference.inHours == 1 ? 'hour ago' : 'hours ago'}';
    } else {
      return 'now';
    }
  }
}
