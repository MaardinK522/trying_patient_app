import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:phyzzicare/generated/assets.dart';

class NewsListviewItem extends StatelessWidget {
  const NewsListviewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var faker = Faker();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                Assets.assetsTherapy,
                height: 70,
                width: 100,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${faker.date.time()} ${faker.company.person.name()}",
                      style: const TextStyle(fontSize: 20),
                      overflow: TextOverflow.fade,
                    ),
                    Text(
                      faker.address.buildingNumber(),
                      style: const TextStyle(fontSize: 10),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
