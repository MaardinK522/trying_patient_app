import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:phyzzicare/list_items/news_listview_item.dart';

class NewsWindowRoute extends StatefulWidget {
  const NewsWindowRoute({Key? key}) : super(key: key);

  @override
  State<NewsWindowRoute> createState() => _NewsWindowRouteState();
}

class _NewsWindowRouteState extends State<NewsWindowRoute> {
  List<String> selectedChips = [];
  List<String> unSelectedChips = [
    "ALL",
    "BRAIN",
    "MENTAL HEALTH",
    "WHO",
    "FACT",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ChipsChoice<String>.multiple(
          choiceStyle: C2ChipStyle.outlined(
            borderWidth: 2,
            borderRadius: BorderRadius.circular(5),
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
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return const NewsListviewItem();
            },
            separatorBuilder: (BuildContext context, int index) => Divider(
              color: Theme.of(context).colorScheme.secondaryContainer,
              thickness: 1,
            ),
          ),
        ),
      ],
    );
  }
}
