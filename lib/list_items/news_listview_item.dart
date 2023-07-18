import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:phyzzicare/generated/assets.dart';

class NewsListviewItem extends StatelessWidget {
  final AnimationController animationController;
  final int index;

  const NewsListviewItem(
      {Key? key, required this.animationController, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var faker = Faker();
    double animationStart = 0.1 * index;
    double animationEnd = animationStart + 0.4;
    return SlideTransition(
      position: Tween(
        begin: const Offset(0, -1),
        end: const Offset(0, 0),
      ).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Interval(
            animationStart,
            animationEnd,
            curve: Curves.ease,
          ),
        ),
      ),
      child: FadeTransition(
        opacity: animationController,
        child: Card(
          elevation: 5,
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 100,
                      height: 70,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            Assets.assetsTherapy,
                          ),
                        ),
                      ),
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
          ),
        ),
      ),
    );
  }
}
