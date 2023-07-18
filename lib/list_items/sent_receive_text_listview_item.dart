import 'package:flutter/material.dart';

class UserSentReceiveTextListViewItem extends StatelessWidget {
  final String textMessage;
  final bool isSent;

  const UserSentReceiveTextListViewItem(
      {Key? key, required this.textMessage, required this.isSent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        (isSent)
            ? Expanded(
                child: Container(),
              )
            : Container(),
        Card(
          color: (isSent)
              ? Theme.of(context).colorScheme.primaryContainer
              : Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(textMessage),
          ),
        ),
        (!isSent)
            ? Expanded(
                child: Container(),
              )
            : Container(),
      ],
    );
  }
}
