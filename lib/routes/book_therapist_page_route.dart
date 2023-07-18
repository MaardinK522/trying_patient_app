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
        appBar: AppBar(
          title: const Text("PhyzziCare"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search_rounded),
                  contentPadding: const EdgeInsets.all(10),
                  hintText: "Search by name, ID, type",
                  hintStyle: const TextStyle(fontStyle: FontStyle.italic),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
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
      ),
    );
  }
}