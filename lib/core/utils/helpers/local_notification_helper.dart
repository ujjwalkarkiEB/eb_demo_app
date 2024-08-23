import 'dart:developer';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:eb_demo_app/core/config/injection/injection.dart';
import 'package:eb_demo_app/core/config/route/app_route.dart';
import 'package:flutter/material.dart';

class LocalNotificationHelper {
  LocalNotificationHelper._();

  static final LocalNotificationHelper instance = LocalNotificationHelper._();

  Future<void> initializeLocalNotifications() async {
    await AwesomeNotifications().initialize(
      "resource://drawable/ebcom",
      [
        NotificationChannel(
          channelGroupKey: 'high_importance_channel',
          channelKey: 'high_importance_channel',
          channelName: 'Basic Notification',
          channelDescription: 'Notification channel for basic task',
          defaultColor: Colors.deepPurple,
          ledColor: Colors.red,
          icon: "resource://drawable/ebcom",
          importance: NotificationImportance.Max,
          channelShowBadge: true,
          onlyAlertOnce: true,
          criticalAlerts: true,
        )
      ],
      channelGroups: [
        NotificationChannelGroup(
          channelGroupKey: 'high_importance_channel_group',
          channelGroupName: "Group 1",
        )
      ],
      debug: true,
    );

    await AwesomeNotifications()
        .isNotificationAllowed()
        .then((isAllowed) async {
      if (!isAllowed) {
        await AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    await AwesomeNotifications().setListeners(
      onActionReceivedMethod: onActionReceivedMethod,
      onNotificationCreatedMethod: onNotificationCreatedMethod,
      onNotificationDisplayedMethod: onNotificationDisplayedMethod,
      onDismissActionReceivedMethod: onDismissActionReceivedMethod,
    );
  }

  Future<void> showNotification({
    final String? senderID,
    required final String title,
    required final String body,
    final String? summary,
    final Map<String, String>? payload,
    final ActionType actionType = ActionType.Default,
    final NotificationLayout notificationLayout = NotificationLayout.Default,
    final NotificationCategory? category,
    final String? bigPicture,
    final List<NotificationActionButton>? actionButtons,
    final bool scheduled = false,
    final int? interval,
  }) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: -1,
        channelKey: 'high_importance_channel',
        title: title,
        body: body,
        actionType: actionType,
        notificationLayout: notificationLayout,
        summary: summary,
        category: category,
        payload: payload,
        bigPicture: bigPicture,
      ),
      actionButtons: actionButtons,
      schedule: scheduled
          ? NotificationInterval(
              interval: interval,
              timeZone: AwesomeNotifications.localTimeZoneIdentifier,
              preciseAlarm: true,
            )
          : null,
    );
  }

  Future<void> onActionReceivedMethod(ReceivedAction recivedAction) async {
    debugPrint("On Action Recived");
    final payload = recivedAction.payload ?? {};
    final senderId = payload['senderId'];
    final senderUserName = payload['senderUserName'];
    if (senderId != null && senderUserName != null) {
      getIt<AppRouter>().pushAll([
        ChatNavigatioRoute(
          children: [
            UserChatsRoute(),
            UserListRoute(),
            PrivateChatRoomRoute(
              reciverID: senderId,
              receiverName: senderUserName,
            ),
          ],
        ),
      ]);
    }
  }

  Future<void> onNotificationCreatedMethod(
      ReceivedNotification notification) async {
    log("On Notification Created Method");
    // Handle notification creation
  }

  Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedAction) async {
    log("On Notification Displayed");
    // Handle notification display
  }

  Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    log("On Notification Dismissed");
    // Handle notification dismissal
  }
}
