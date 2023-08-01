import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:phyzzicare/generated/assets.dart';
import 'package:phyzzicare/models/therapist_listitem.dart';

import '../list_items/book_therapist_route_therapist_listview_item.dart';

class BookTherapistPageRoute extends StatelessWidget {
  const BookTherapistPageRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: TextFormField(
            maxLines: 1,
            autofocus: true,
            textInputAction: TextInputAction.search,
            autocorrect: true,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              isDense: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: (Theme.of(context).colorScheme.brightness ==
                          Brightness.dark)
                      ? Theme.of(context).colorScheme.primary
                      : Colors.white,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              hintStyle: const TextStyle(fontStyle: FontStyle.italic),
              hintText: "Search IDs, names...",
            ),
          ),
          actions: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close_rounded),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return BookTherapistRouteTherapistListViewItem(
                    therapist: TherapistListItemModel(
                      therapistName: Faker().person.name(),
                      therapistID: Faker().guid.guid(),
                      index: index,
                      therapistImage: Assets.assetsGhandi,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
