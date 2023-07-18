import 'dart:async';

import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:phyzzicare/list_items/news_listview_item.dart';

import '../../utils/standard_vals.dart';

class NewsWindowRoute extends StatefulWidget {
  const NewsWindowRoute({Key? key}) : super(key: key);

  @override
  State<NewsWindowRoute> createState() => _NewsWindowRouteState();
}

class _NewsWindowRouteState extends State<NewsWindowRoute>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  List<String> selectedChips = [];
  List<String> unSelectedChips = [
    "All",
    "Strokes",
    "Brain",
    "Mental Health",
    "World Health Organization",
    "Facts",
    "Specials",
  ];
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
    super.dispose();
    timer.cancel();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        ChipsChoice<String>.multiple(
          choiceStyle: C2ChipStyle.outlined(
            borderWidth: 2,
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: WrapAlignment.start,
          value: selectedChips,
          onChanged: (values) {
            setState(() {
              selectedChips = values;
            });
          },
          choiceItems: C2Choice.listFrom(
            source: unSelectedChips,
            value: (index, value) => value,
            label: (index, value) => value,
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: NewsListviewItem(
                  animationController: animationController,
                  index: index ~/ 2,
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) => Divider(
              color: Theme.of(context).colorScheme.secondaryContainer,
              thickness: 2,
            ),
          ),
        ),
      ],
    );
  }
}
