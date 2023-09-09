import 'package:flutter/material.dart';
import 'package:phyzzicare/windows/settings_window_route.dart';

import '../windows/call_history_window_route.dart';
import '../windows/home_window_route.dart';
import '../windows/prescription_history_window_route.dart';

class HomePageRoute extends StatefulWidget {
  const HomePageRoute({Key? key}) : super(key: key);

  @override
  State<HomePageRoute> createState() => _HomePageRouteState();
}

class _HomePageRouteState extends State<HomePageRoute> {
  int bottomNavigationItemIndex = 1;
  late final PageController mainPageController = PageController(
    initialPage: bottomNavigationItemIndex,
    keepPage: true,
  );
  final List<Widget> _tabWindowsWidgets = const [
    CallHistoryWindowRoute(),
    HomeWindowRoute(),
    PrescriptionsHistoryWindowRoute(),
    SettingsWindowRoute(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            bottomNavigationItemIndex = index;
          });
        },
        controller: mainPageController,
        children: _tabWindowsWidgets,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomNavigationItemIndex,
        iconSize: 30,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() {
            bottomNavigationItemIndex = index;
          });
          mainPageController.animateToPage(
            bottomNavigationItemIndex,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
        elevation: 10,
        unselectedIconTheme: const IconThemeData(size: 25),
        unselectedItemColor: Theme.of(context).colorScheme.onBackground,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        selectedIconTheme: const IconThemeData(size: 30),
        items: const [
          BottomNavigationBarItem(
            label: "Call",
            icon: Icon(Icons.call_rounded),
          ),
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home_rounded),
          ),
          BottomNavigationBarItem(
            label: "Medication",
            icon: Icon(Icons.medication_rounded),
          ),
          BottomNavigationBarItem(
            label: "Setting",
            icon: Icon(Icons.settings_rounded),
          ),
        ],
      ),
    );
  }
}
