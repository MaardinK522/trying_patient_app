import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:phyzzicare/generated/assets.dart';

class CallHistoryListItem extends StatelessWidget {
  final int index;

  const CallHistoryListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var faker = Faker();
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  faker.person.name(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Text(
                  faker.date.justTime(),
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          FilledButton.tonal(
            style: ButtonStyle(
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
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
