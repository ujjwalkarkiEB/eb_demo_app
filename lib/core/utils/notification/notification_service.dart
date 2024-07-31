import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';

// Top-level function for handling background notifications
void backgroundNotificationResponseHandler(
    NotificationResponse notification) async {
  print('Received background notification response: $notification');
}

@lazySingleton
class NotificationService {
  final FlutterLocalNotificationsPlugin notificationPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    // define settings for android
    const AndroidInitializationSettings initializationAndroidSettings =
        AndroidInitializationSettings('logo');
    // define settinsg for ios
    final DarwinInitializationSettings initializationSettingIOS =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      defaultPresentSound: true,
      defaultPresentAlert: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: (id, title, body, payload) async {
        print('Received local notification: $id, $title, $body, $payload');
      },
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationAndroidSettings,
      iOS: initializationSettingIOS,
    );

    await notificationPlugin.initialize(
      initializationSettings,
      onDidReceiveBackgroundNotificationResponse:
          backgroundNotificationResponseHandler,
    );
  }

  Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async {
    print('Showing notification: $id, $title, $body, $payload');
    await notificationPlugin.show(
      id,
      title,
      body,
      await notificationDetails(),
      payload: payload,
    );
  }

  Future<NotificationDetails> notificationDetails() async {
    return const NotificationDetails(
      iOS: DarwinNotificationDetails(),
      android: AndroidNotificationDetails(
        'channelId',
        'channelName',
        importance: Importance.max,
        priority: Priority.high,
      ),
    );
  }
}

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final NotificationService notificationService = NotificationService();
//   await notificationService.initNotification();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Local Notification',
//       theme: ThemeData(
//         appBarTheme: const AppBarTheme(
//             backgroundColor: Colors.deepPurple,
//             centerTitle: true,
//             titleTextStyle: TextStyle(
//               fontSize: 18,
//               color: Colors.white,
//             )),
//         primaryColor: Colors.deepPurple,
//         scaffoldBackgroundColor: Colors.deepPurple.shade200,
//         useMaterial3: true,
//       ),
//       home: HomePage(),
//     );
//   }
// }
