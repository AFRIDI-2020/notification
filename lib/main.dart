import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notification/home.dart';
import 'package:notification/home_controller.dart';
import 'package:notification/notification_navigator.dart';
import 'package:notification/notification_screen.dart';
import 'package:notification/notification_service.dart'
    show NotificationService;
import 'package:notification/wifi_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().initialize();
  NotificationService().setListeners();
  // Check if the app was launched from a notification
  ReceivedAction? initialNotification = await AwesomeNotifications()
      .getInitialNotificationAction(removeFromActionEvents: false);
  runApp(MyApp(initialNotification));
}

class MyApp extends StatefulWidget {
  final ReceivedAction? initialNotification;
  const MyApp(this.initialNotification,{super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();

    if (widget.initialNotification != null) {
      final payload = widget.initialNotification!.body;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        NotificationNavigator.navigateTo("/notification");
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: _router,
    );
  }

  final GoRouter _router = GoRouter(
    navigatorKey: NotificationNavigator.navigatorKey,
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeController();
        },
        routes: <RouteBase>[
          GoRoute(
            path: '/notification',
            name: "notification",
            builder: (BuildContext context, GoRouterState state) {
              return const NotificationScreen();
            },
          ),

          GoRoute(
            path: '/wifi',
            name: "wifi",
            builder: (BuildContext context, GoRouterState state) {
              return const WifiList();
            },
          ),
        ],
      ),
    ],
  );
}
