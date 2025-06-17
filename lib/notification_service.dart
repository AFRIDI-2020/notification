import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:notification/notification_controller.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();

  factory NotificationService() => _instance;

  NotificationService._internal();

  static const generalChannelId = "general_channel";

  // Initialize notification settings
  Future<void> initialize() async {
    await AwesomeNotifications().initialize(
      null, // default icon
      [
        NotificationChannel(
          channelKey: generalChannelId,
          channelName: 'General Notification',
          channelDescription: 'Notification channel for general notification',
          defaultColor: Colors.blue,
          ledColor: Colors.white,
          importance: NotificationImportance.High,
        ),
      ],
      debug: true,
    );

    // Request permissions
    await requestPermission();
  }

  // Request permission to show notifications
  Future<void> requestPermission() async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) {
      await AwesomeNotifications().requestPermissionToSendNotifications();
    }
  }

  // Show instant notification
  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    Map<String, String?>? payload,
    String? channelId,
  }) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id,
        channelKey: channelId ?? generalChannelId,
        title: title,
        body: body,
        payload: payload,
        notificationLayout: NotificationLayout.Default,
      ),
    );
  }

  // Schedule notification
  Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required Duration delayInSeconds,
    String? channelId,
  }) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id,
        channelKey: channelId ?? generalChannelId,
        title: title,
        body: body,
      ),
      schedule: NotificationInterval(
        interval: delayInSeconds,
        timeZone: await AwesomeNotifications().getLocalTimeZoneIdentifier(),
        repeats: false,
      ),
      // schedule: NotificationCalendar(
      //   hour: 15,
      //   minute: 19,
      //   timeZone: await AwesomeNotifications().getLocalTimeZoneIdentifier(),
      // ),
    );
  }

  void setListeners() {
    AwesomeNotifications().setListeners(
      onNotificationCreatedMethod: NotificationController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod: NotificationController.onNotificationDisplayedMethod,
      onDismissActionReceivedMethod: NotificationController.onDismissActionReceivedMethod,
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
    );
  }
}
