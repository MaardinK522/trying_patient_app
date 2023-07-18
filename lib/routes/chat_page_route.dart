import 'package:flutter/material.dart';
import 'package:phyzzicare/generated/assets.dart';
import 'package:phyzzicare/list_items/sent_receive_text_listview_item.dart';

class ChatPageRoute extends StatefulWidget {
  const ChatPageRoute({Key? key}) : super(key: key);

  @override
  State<ChatPageRoute> createState() => _ChatPageRouteState();
}

class _ChatPageRouteState extends State<ChatPageRoute> {
  TextEditingController textFieldController = TextEditingController();

  late List<List<Object>> mMessagesList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.adaptive.arrow_back),
        ),
        titleSpacing: 5,
        title: Row(
          children: [
            const SizedBox(width: 10),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(Assets.assetsGhandi),
                ),
              ),
            ),
            const SizedBox(width: 10),
            const Text("Chat bot"),
          ],
        ),
        actions: [
          PopupMenuButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            itemBuilder: (buttons) => [
              const PopupMenuItem(
                child: Text("Show profile"),
              ),
              const PopupMenuItem(
                child: Text("Report"),
              ),
              const PopupMenuItem(
                child: Text("Wallpaper"),
              ),
              const PopupMenuItem(
                child: Text("Search"),
              ),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                reverse: true,
                itemCount: mMessagesList.length,
                itemBuilder: (context, index) {
                  return UserSentReceiveTextListViewItem(
                    textMessage: "${mMessagesList[index][0]}",
                    isSent: mMessagesList[index][1] as bool,
                  );
                },
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextField(
                    controller: textFieldController,
                    decoration: InputDecoration(
                      hintText: "Message",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: 50,
                child: OutlinedButton(
                  onPressed: () {
                    if (textFieldController.text.isNotEmpty) {
                      var message = textFieldController.text;
                      setState(() {
                        textFieldController.clear();
                        FocusScope.of(context).unfocus();
                        debugPrint(textFieldController.text);
                        mMessagesList.insert(0, [message, true]);
                      });
                    }
                  },
                  onLongPress: () {
                    if (textFieldController.text.isNotEmpty) {
                      var message = textFieldController.text;
                      setState(() {
                        textFieldController.clear();
                        FocusScope.of(context).unfocus();
                        debugPrint(textFieldController.text);
                        mMessagesList.insert(0, [message, false]);
                      });
                    }
                  },
                  child: Icon(
                    Icons.send_rounded,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
