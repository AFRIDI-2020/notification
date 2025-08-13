import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notification/home.dart';
import 'package:notification/home_controller.dart';
import 'package:notification/login/login_page.dart';
import 'package:notification/menu_view.dart';
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
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  //final ReceivedAction? initialNotification;
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();

    // if (widget.initialNotification != null) {
    //   final payload = widget.initialNotification!.body;
    //
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     NotificationNavigator.navigateTo("/notification");
    //   });
    // }
  }


  @override
  Widget build(BuildContext context) {
    // return MaterialApp.router(
    //   title: 'Flutter Demo',
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData(
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //   ),
    //   routerConfig: _router,
    // );
    return const MaterialApp(
      title: 'Counter App',
      home: Home(),
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              key: ValueKey("wifi button"),
              onPressed: () {
                //context.pushNamed("wifi");
                Navigator.push(context, MaterialPageRoute(builder: (_) => WifiList()));
              },
              child: Text("View wifi"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Provide a Key to this button. This allows finding this
        // specific button inside the test suite, and tapping it.
        key: const Key('increment'),
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
