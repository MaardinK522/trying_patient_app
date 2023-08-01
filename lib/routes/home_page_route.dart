import 'package:flutter/material.dart';
import 'package:phyzzicare/transitions/custom_fade_transition.dart';

import '../windows/call_history_window_route.dart';
import '../windows/home_window_route.dart';
import '../windows/prescription_history_window_route.dart';
import '../windows/settings_window_route.dart';

class HomePageRoute extends StatefulWidget {
  const HomePageRoute({Key? key}) : super(key: key);

  @override
  State<HomePageRoute> createState() => _HomePageRouteState();
}

class _HomePageRouteState extends State<HomePageRoute>
    with TickerProviderStateMixin {
  final List<String> _tabs = [
    "CALLS",
    "HOME",
    "PRESCRIPTION",
  ];
  final List<Widget> _tabWindowsWidgets = const [
    CallHistoryWindowRoute(),
    HomeWindowRoute(),
    PrescriptionsHistoryWindowRoute(),
  ];
  late final TabController _tabController = TabController(
    length: _tabs.length,
    vsync: this,
  );
  int bottomNavigationItemIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        shadowColor: Theme.of(context).colorScheme.background,
        automaticallyImplyLeading: false,
        title: const Text("PhyzziCare", style: TextStyle(fontSize: 25)),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                CustomFadeTransition(page: const SettingsWindowRoute()),
              );
            },
            icon: const Icon(Icons.settings_rounded),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorWeight: 2,
          indicatorColor: Theme.of(context).colorScheme.primaryContainer,
          tabs: _tabs
              .map<Widget>((tab) => Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      tab,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
              .toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabWindowsWidgets,
      ),
    );
  }
}
