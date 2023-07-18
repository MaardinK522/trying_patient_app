import 'dart:async';

import 'package:flutter/material.dart';
import 'package:phyzzicare/list_items/prescription_route_listview_item.dart';
import 'package:phyzzicare/utils/standard_vals.dart';

class PrescriptionsHistoryWindowRoute extends StatefulWidget {
  const PrescriptionsHistoryWindowRoute({Key? key}) : super(key: key);

  @override
  State<PrescriptionsHistoryWindowRoute> createState() =>
      _PrescriptionsHistoryWindowRouteState();
}

class _PrescriptionsHistoryWindowRouteState
    extends State<PrescriptionsHistoryWindowRoute>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Timer timer;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: AnimationDuration.listviewItemsDuration,
    );
    timer = Timer(
        const Duration(milliseconds: 700), () => animationController.forward());
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Prescription history",
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return PrescriptionRouteListviewItem(
                    animationController: animationController,
                    index: index ~/ 2);
              },
            ),
          ),
        ],
      ),
    );
  }
}
