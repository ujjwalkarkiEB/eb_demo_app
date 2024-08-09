import 'dart:ffi';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class NotificationService {
  /// Initializes the notification service by setting up notification channels,
  /// requesting permissions, and setting up listeners for notification events.
  Future<void> initializeNotification() async {
    await AwesomeNotifications().initialize(
      null, // Set to null for using the default app icon
      [
        NotificationChannel(
          channelGroupKey: 'high_importance_channel',
          channelKey: 'high_importance_channel',
          channelName: 'Basic Notification',
          channelDescription: 'Notification channel for basic task',
          defaultColor: Colors.deepPurple,
          ledColor: Colors.red,
          importance: NotificationImportance.Max,
          channelShowBadge: true,
          onlyAlertOnce: true,
          playSound: true,
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

    // Check if notifications are allowed, and request permission if not
    final isNotificationAllowed =
        await AwesomeNotifications().isNotificationAllowed();
    if (!isNotificationAllowed) {
      await AwesomeNotifications().requestPermissionToSendNotifications();
    }

    // Setup listeners for notification events
    await AwesomeNotifications().setListeners(
      onActionReceivedMethod: onActionReceivedMethod,
      onNotificationCreatedMethod: onNotificationCreatedMethod,
      onNotificationDisplayedMethod: onNotificationDisplayedMethod,
      onDismissActionReceivedMethod: onDismissActionReceivedMethod,
    );
  }

  /// Handles actions received from notifications, such as user taps or dismissals.
  ///
  /// This method is triggered when the user interacts with a notification.
  /// [recivedAction] - The action that was received from the notification.
  Future<void> onActionReceivedMethod(ReceivedAction recivedAction) async {
    debugPrint("On Action Recived");
    final payload = recivedAction.payload ?? {};
    // Add navigation or other actions based on the notification's payload
  }

  /// Callback method triggered when a notification is created.
  ///
  /// You can use this method to perform any actions when a notification is
  /// successfully created, such as logging or analytics.
  ///
  /// [notification] - The notification that was created.
  Future<void> onNotificationCreatedMethod(
      ReceivedNotification notification) async {
    debugPrint("On Notification Created Method");
  }

  /// Callback method triggered when a notification is displayed.
  ///
  /// Use this method to track when notifications are shown to the user.
  ///
  /// [recivedAction] - The action associated with the displayed notification.
  Future<void> onNotificationDisplayedMethod(
      ReceivedNotification recivedAction) async {
    debugPrint("On Notification Displayed");
  }

  /// Callback method triggered when a notification is dismissed by the user.
  ///
  /// This method allows you to handle cases where the user dismisses a
  /// notification, which can be useful for cleanup or analytics.
  ///
  /// [recivedAction] - The action associated with the dismissed notification.
  Future<void> onDismissActionReceivedMethod(
      ReceivedAction recivedAction) async {
    debugPrint("On Notification Dismissed");
  }

  /// Shows a notification with the provided parameters.
  ///
  /// This method allows to customize various aspects of the notification,
  /// including its title, body, payload, layout, and whether it's scheduled.
  ///
  /// [title] - The title of the notification.
  /// [body] - The body content of the notification.
  /// [summary] - An optional summary for the notification.
  /// [payload] - Optional key-value data to pass with the notification.
  /// [actionType] - Defines the action type for the notification (Default is [ActionType.Default]).
  /// [notificationLayout] - The layout of the notification (Default is [NotificationLayout.Default]).
  /// [category] - Optional category to classify the notification.
  /// [bigPicture] - Optional URL or asset for a big picture in the notification.
  /// [actionButtons] - Optional list of buttons for user actions within the notification.
  /// [scheduled] - Determines if the notification should be scheduled (Default is false).
  /// [interval] - The interval time in seconds for scheduled notifications (required if [scheduled] is true).
  Future<void> showNotification({
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
    // Ensure interval is provided if the notification is scheduled
    assert(!scheduled || (scheduled && interval != null));

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: -1, // Generate a unique notification ID
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
              interval: interval!,
              timeZone: await AwesomeNotifications.localTimeZoneIdentifier,
              preciseAlarm: true,
            )
          : null,
    );
  }
}
