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
        child: Container(
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
        ),
      ),
    );
  }
}
