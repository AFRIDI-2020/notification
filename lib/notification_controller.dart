import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:notification/notification_navigator.dart';

class NotificationController {
  // Called when a notification is created
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    print('Notification created: ${receivedNotification.payload}');
    // You can add logic here like updating a badge count, analytics etc.
  }

  // Called when a notification is displayed on the device
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    print('Notification displayed: ${receivedNotification.title}');
  }

  // Called when user dismisses the notification
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    print('Notification dismissed: ${receivedAction.title}');
  }

  // Optional: Called when user taps a notification
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    print('Notification action received: ${receivedAction.payload}');
    // You can navigate to a specific screen here using payload
    // Check if app is in background or terminated
    if (AwesomeStringUtils.isNullOrEmpty(receivedAction.buttonKeyInput)) {
      // This will be triggered on tap
      AwesomeNotifications().getInitialNotificationAction(removeFromActionEvents: false);
    }

    // Optional: Save data, log or handle based on payload
    String? route = receivedAction.payload?['route'];
    print("route got $route");

    if (route != null) {
      // You can store the navigation route and use it after app launches
      NotificationNavigator.navigateTo(route);
    }
  }
}
