import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FcmHelper {
  static final _messaging = FirebaseMessaging.instance;
  static Future<void> requestPermission() async {
    await _messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  static Future<String?> getFcmToken() async {
    final token = await _messaging.getToken();
    log('FCM Token: $token');
    return token;
  }
}
