import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:phyzzicare/generated/assets.dart';

class CallHistoryListItem extends StatelessWidget {
  final AnimationController animationController;
  final int index;

  const CallHistoryListItem(
      {super.key, required this.animationController, required this.index});

  @override
  Widget build(BuildContext context) {
    double animationStart = 0.1 * index;
    double animationEnd = animationStart + 0.4;
    var faker = Faker();
    return SlideTransition(
      position: Tween(
        begin: const Offset(0, -1),
        end: const Offset(0, 0),
      ).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Interval(animationStart, animationEnd, curve: Curves.easeIn),
        ),
      ),
      child: FadeTransition(
        opacity: animationController,
        child: Container(
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
        ),
      ),
    );
  }
}
