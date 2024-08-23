import 'package:eb_demo_app/core/config/injection/injection.dart';
import 'package:eb_demo_app/core/config/route/app_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:developer';

class FirebaseNotificationHelper {
  FirebaseNotificationHelper._();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  /// Static method to initialize Firebase notifications.
  static Future<void> initializeFirebaseNotifications() async {
    final helper = FirebaseNotificationHelper._();
    await helper._firebaseMessaging.requestPermission();
    final fcmToken = await helper._firebaseMessaging.getToken();
    log('FCM Token: $fcmToken');

    // Handling the initial message when the app is launched from a killed state
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        helper._handleNotificationClick(message);
      }
    });

    // Handling a notification click event when the app is in the background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log('onMessageOpenedApp: ${message.notification?.title}');
      helper._handleNotificationClick(message);
    });

    // // Handle foreground messages
    // FirebaseMessaging.onMessage.listen(helper._handleForegroundMessage);

    // Handle background messages (static method)
    FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);
  }

  /// Non-static method to handle foreground messages.
  void _handleForegroundMessage(RemoteMessage message) {
    log('Foreground message received: ${message.notification?.title}');
  }

  /// Non-static method to handle notification clicks.
  void _handleNotificationClick(RemoteMessage message) {
    log('Notification clicked: ${message.notification?.title}');
    final data = message.data;
    // Extract data to determine the screen to open
    final senderId = data['senderId'];
    final senderUserName = data['senderUserName'];

    if (senderId != null && senderUserName != null) {}
  }

  /// Static method to handle background messages.
  static Future<void> _handleBackgroundMessage(RemoteMessage message) async {
    log('Background message received: ${message.notification?.title}');
    // Handle the notification here
  }
}
