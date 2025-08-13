import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notification/dialog/animated_dialog.dart';
import 'package:notification/notification_service.dart';
import 'package:notification/wifi_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                NotificationService().showNotification(
                  id: 1,
                  title: "Hello",
                  body: "You are invited",
                  payload: {"route": "notification"},
                );
              },
              child: Text("Send Notification"),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                context.pushNamed("notification");
              },
              child: Text("View Notification"),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              key: Key("wifi button"),
              onPressed: () {
                //context.pushNamed("wifi");
                Navigator.push(context, MaterialPageRoute(builder: (_) => WifiList()));
              },
              child: Text("View wifi"),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              key: Key("Dialog"),
              onPressed: () {
                showDialog(context: context, builder: (_){
                  return AnimatedDialog();
                });
              },
              child: Text("Dialog"),
            ),
          ],
        ),
      ),
    );
  }
}
