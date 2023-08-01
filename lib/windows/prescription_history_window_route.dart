import 'package:flutter/material.dart';
import 'package:phyzzicare/list_items/prescription_route_listview_item.dart';

class PrescriptionsHistoryWindowRoute extends StatefulWidget {
  const PrescriptionsHistoryWindowRoute({Key? key}) : super(key: key);

  @override
  State<PrescriptionsHistoryWindowRoute> createState() =>
      _PrescriptionsHistoryWindowRouteState();
}

class _PrescriptionsHistoryWindowRouteState
    extends State<PrescriptionsHistoryWindowRoute> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Expanded(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return const PrescriptionRouteListviewItem();
          },
        ),
      ),
    );
  }
}
