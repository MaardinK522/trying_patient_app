import 'package:flutter/material.dart';

import '../../list_items/call_history_listview_item.dart';

class CallHistoryWindowRoute extends StatefulWidget {
  const CallHistoryWindowRoute({Key? key}) : super(key: key);

  @override
  State<CallHistoryWindowRoute> createState() => _CallHistoryWindowRouteState();
}

class _CallHistoryWindowRouteState extends State<CallHistoryWindowRoute> {
  var itemCount = 20;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Expanded(
        child: ListView.builder(
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return CallHistoryListItem(
              index: index ~/ 2,
            );
          },
        ),
      ),
    );
  }
}
