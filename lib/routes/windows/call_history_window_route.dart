import 'dart:async';

import 'package:flutter/material.dart';
import 'package:phyzzicare/utils/standard_vals.dart';

import '../../list_items/call_history_listview_item.dart';

class CallHistoryWindowRoute extends StatefulWidget {
  const CallHistoryWindowRoute({Key? key}) : super(key: key);

  @override
  State<CallHistoryWindowRoute> createState() => _CallHistoryWindowRouteState();
}

class _CallHistoryWindowRouteState extends State<CallHistoryWindowRoute>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  var itemCount = 20;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: AnimationDuration.listviewItemsDuration,
    );
    Timer(const Duration(milliseconds: 700),
        () => _animationController.forward());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return CallHistoryListItem(
            animationController: _animationController,
            index: index ~/ 2,
          );
        },
      ),
    );
  }
}
