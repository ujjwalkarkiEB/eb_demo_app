import 'package:eb_demo_app/core/utils/helpers/fcm_helpers.dart';
import 'package:eb_demo_app/core/utils/helpers/local_notification_helper.dart';
import 'package:injectable/injectable.dart';

@injectable
class NotificationService {
  final LocalNotificationHelper _localNotificationHelper =
      LocalNotificationHelper.instance;

  Future<void> initializeNotifications() async {
    await _localNotificationHelper.initializeLocalNotifications();
    await FirebaseNotificationHelper.initializeFirebaseNotifications();
  }

  Future<void> showLocalNotification({
    required String title,
    required String body,
    String? summary,
    Map<String, String>? payload,
  }) async {
    await _localNotificationHelper.showNotification(
      title: title,
      body: body,
      summary: summary,
      payload: payload,
    );
  }
}
