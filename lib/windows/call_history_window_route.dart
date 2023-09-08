import 'package:flutter/material.dart';

import '../../list_items/call_history_listview_item.dart';

class CallHistoryWindowRoute extends StatefulWidget {
  const CallHistoryWindowRoute({Key? key}) : super(key: key);

  @override
  State<CallHistoryWindowRoute> createState() => _CallHistoryWindowRouteState();
}

class _CallHistoryWindowRouteState extends State<CallHistoryWindowRoute> {
  var itemCount = 10;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: itemCount,
      itemBuilder: (context, index) => const CallHistoryListItem(),
      separatorBuilder: (BuildContext context, int index) => Divider(
        height: 10,
        thickness: 1,
        color: Theme.of(context).colorScheme.secondaryContainer,
      ),
    );
  }
}
