import 'package:bnb_flutter/bnb_flutter.dart';
import 'package:flutter/material.dart';

class HomeController extends StatefulWidget {
  const HomeController({super.key});

  @override
  State<HomeController> createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BNB app bar"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Selected Index : $selectedIndex"),
      ),
      bottomNavigationBar: BnbWidget(
        items: [
          BnbItem(
            iconData: Icons.home,
          ),
          BnbItem(
            iconData: Icons.list,
          ),
          BnbItem(
            iconData: Icons.settings,
          ),
          BnbItem(
            iconData: Icons.book_outlined,
          ),
          BnbItem(
            iconData: Icons.person,
          ),
        ],
        onTap: (p0) => setState(() {
          selectedIndex = p0;
        }),
        selectedIndex: selectedIndex,
        style: BnbStyle(
          iconSize: const Size(24, 24),
        ),
      ),
    );
  }
}
