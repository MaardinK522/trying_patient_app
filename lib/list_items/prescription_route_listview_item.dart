import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class PrescriptionRouteListviewItem extends StatelessWidget {
  final int index;
  final AnimationController animationController;

  const PrescriptionRouteListviewItem(
      {Key? key, required this.index, required this.animationController})
      : super(key: key);

  String getFakeDate() {
    var date = DateTime.now();
    return "${date.day}/${date.month}/${date.year} ${Faker().date.justTime()}";
  }

  @override
  Widget build(BuildContext context) {
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
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Theme.of(context).colorScheme.secondary,
              width: 2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/ghandi.jpeg"),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text(
                        "Mahatma Ghandi",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 2,
                  height: 20,
                  color: Theme.of(context).colorScheme.secondaryContainer,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            "Fever and cold",
                            style: TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            getFakeDate(),
                            style: const TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                    FilledButton.tonal(
                      style: ButtonStyle(
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text("Details"),
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
