import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:phyzzicare/generated/assets.dart';

class PrescriptionDetailsPageRoute extends StatelessWidget {
  final String personName;

  final int itemCount;

  final String medicationTopic;

  const PrescriptionDetailsPageRoute({
    super.key,
    required this.personName,
    required this.itemCount,
    required this.medicationTopic,
  });

  @override
  Widget build(BuildContext context) {
    var demoItems = getRandomStrings(itemCount);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(personName),
      ),
      body: Container(
        color: Theme.of(context).colorScheme.secondaryContainer,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            color: Theme.of(context).colorScheme.secondaryContainer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 0,
            child: InkWell(
              splashFactory: InkRipple.splashFactory,
              splashColor: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                Fluttertoast.showToast(
                  msg: "Registering order is under development.",
                );
              },
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: const Image(
                                      fit: BoxFit.cover,
                                      image: AssetImage(Assets.assetsGhandi),
                                      height: 50,
                                      width: 50,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    personName,
                                    style: const TextStyle(
                                      fontSize: 25,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                "Meds: ",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: demoItems
                                .map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.only(bottom: 5.0),
                                    child: Text(
                                      e,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                        child: Text(
                          "Order",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
final Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => _chars.codeUnitAt(
          _rnd.nextInt(_chars.length),
        ),
      ),
    );

List<String> getRandomStrings(int count) {
  var randomStrings = [""];
  for (int a = 0; a < count; a++) {
    int randomCount = Random().nextInt(15) + 2;
    randomStrings.add("${a + 1}). ${getRandomString(randomCount)}");
  }
  return randomStrings;
}
