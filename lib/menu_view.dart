import 'package:flutter/material.dart';
import 'package:notification/rotate_widget.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    var count = ValueNotifier<int>(0);
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("Item \$index"),
            trailing: RepaintBoundary(
              child: RotatingWidget(),
            ),
          );
        },
      ),
    );
  }
}
