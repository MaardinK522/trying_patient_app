import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:phyzzicare/routes/search_page_route.dart';
import 'package:phyzzicare/routes/windows/call_history_window_route.dart';
import 'package:phyzzicare/routes/windows/home_window_route.dart';
import 'package:phyzzicare/routes/windows/news_window_route.dart';
import 'package:phyzzicare/routes/windows/prescription_history_window_route.dart';
import 'package:phyzzicare/routes/windows/settings_window_route.dart';
import 'package:phyzzicare/transitions/custom_fade_transition.dart';
import 'package:phyzzicare/utils/standard_vals.dart';

class HomePageRoute extends StatefulWidget {
  const HomePageRoute({Key? key}) : super(key: key);

  @override
  State<HomePageRoute> createState() => _HomePageRouteState();
}

class _HomePageRouteState extends State<HomePageRoute>
    with TickerProviderStateMixin {
  late final List<Widget> _allWindowChildren = const [
    CallHistoryWindowRoute(),
    PrescriptionsHistoryWindowRoute(),
    HomeWindowRoute(),
    NewsWindowRoute(),
    SettingsWindowRoute(),
  ];

  int bottomNavigationItemIndex = 2;

  final PageController bodyPageController = PageController(
    initialPage: 2,
    keepPage: false,
  );

  @override
  Widget build(BuildContext context) {
    debugPrint(
        "Font family: ${Theme.of(context).textTheme.bodySmall?.fontFamily}");
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
        title: const Text("PhyzziCare!", style: TextStyle(fontSize: 25)),
        actions: [
          IconButton(
            onPressed: () {
              Fluttertoast.showToast(
                  msg: "This features is not ready to be released for user");
            },
            icon: const Icon(Icons.notifications_rounded),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                CustomFadeTransition(page: const SearchPageRoute()),
              );
            },
            icon: const Icon(Icons.search_rounded),
          ),
        ],
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: bodyPageController,
        children: _allWindowChildren,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            bottomNavigationItemIndex = index;
            bodyPageController.animateToPage(
              bottomNavigationItemIndex,
              duration: AnimationDuration.bottomNavigationDuration,
              curve: Curves.ease,
            );
          });
        },
        unselectedItemColor: Colors.grey,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: bottomNavigationItemIndex,
        items: const [
          BottomNavigationBarItem(
            label: "Call",
            icon: Icon(Icons.call),
          ),
          BottomNavigationBarItem(
            label: "Prescriptions",
            icon: Icon(Icons.list_alt_rounded),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper_rounded),
            label: "News",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_rounded),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
