import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import '../generated/assets.dart';

class CallHistoryListItem extends StatelessWidget {
  const CallHistoryListItem({super.key});

  @override
  Widget build(BuildContext context) {
    var faker = Faker();
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              Assets.assetsGhandi,
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  faker.person.name(),
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  faker.date.justTime(),
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          FilledButton.tonal(
            style: ButtonStyle(
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            onPressed: () {},
            child: const Row(
              children: [
                Icon(Icons.call, size: 20),
                SizedBox(width: 10),
                Text("Call", style: TextStyle(fontSize: 15))
              ],
            ),
          )
        ],
      ),
    );
  }
}
