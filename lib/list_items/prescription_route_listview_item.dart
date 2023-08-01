import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:phyzzicare/generated/assets.dart';

class PrescriptionRouteListviewItem extends StatelessWidget {

  const PrescriptionRouteListviewItem({Key? key})
      : super(key: key);

  String getFakeDate() {
    var date = DateTime.now();
    return "${date.day}/${date.month}/${date.year} ${Faker().date.justTime()}";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Theme.of(context).colorScheme.secondaryContainer,
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
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
                const Expanded(
                  child: Text(
                    "Mahatma Ghandi",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    "Fever and cold",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                FilledButton.tonal(
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
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
    );
  }
}
