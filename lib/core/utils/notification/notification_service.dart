import 'dart:developer';
import 'dart:ffi';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:eb_demo_app/core/config/injection/injection.dart';
import 'package:eb_demo_app/core/config/route/app_route.dart';
import 'package:eb_demo_app/core/utils/constants/images.dart';
import 'package:eb_demo_app/core/utils/constants/strings.dart';
import 'package:eb_demo_app/core/utils/local_storage/database_helper.dart';
import 'package:eb_demo_app/core/utils/notification/notification_badge_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@injectable
class NotificationService {
  final DatabaseHelper _databaseHelper;

  NotificationService(this._databaseHelper);
  Future<void> initializeNotification() async {
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
          // playSound: true,
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
      resetBadgeCount(senderId);
    }
  }

  Future<void> onNotificationCreatedMethod(
      ReceivedNotification notification) async {
    debugPrint("On Notification Created Method");
  }

  Future<void> onNotificationDisplayedMethod(
      ReceivedNotification recivedAction) async {
    debugPrint("On Notification Displayed");
  }

  Future<void> onDismissActionReceivedMethod(
      ReceivedAction recivedAction) async {
    debugPrint("On Notification Received");
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
    assert(!scheduled || (scheduled && interval != null));
    late final int? badgeCount;
    if (senderID != null) {
      badgeCount = await getBadgeCount(senderID);
    }
    log('badgecount: ${badgeCount}');

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
        badge: badgeCount,
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

  Future<void> incrementBadgeCount(String userId) async {
    final box = _databaseHelper.notificationBadgeBox;

    NotificationBadgeModel? model;
    try {
      model = box.values.firstWhere((item) => item.userId == userId);
    } catch (e) {
      model = null;
    }

    if (model == null) {
      // If no model exists, create a new one with count set to 1
      model = NotificationBadgeModel(userId: userId, badgeCount: 1);
      await box.add(model);
    } else {
      // Increment the badge count
      model.incrementUnreadCount();
    }
  }

  Future<int> getBadgeCount(String userId) async {
    final box = _databaseHelper.notificationBadgeBox;

    NotificationBadgeModel? model =
        box.values.firstWhere((item) => item.userId == userId);
    return model.badgeCount;
  }

  void resetBadgeCount(String userId) async {
    final box = _databaseHelper.notificationBadgeBox;

    NotificationBadgeModel? model = box.values.firstWhere(
      (item) => item.userId == userId,
    );

    if (model != null) {
      model.resetUnreadCount();
    }
  }
}
