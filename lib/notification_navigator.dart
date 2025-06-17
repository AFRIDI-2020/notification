import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static void navigateTo(String routeName) {
    navigatorKey.currentContext?.go('/$routeName');
  }
}