import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:phyzzicare/generated/assets.dart';
import 'package:phyzzicare/routes/book_therapist_page_route.dart';

import '../../exclusive_widgets/home_page_widgets/home_page_image_pageview.dart';

class HomeWindowRoute extends StatelessWidget {
  const HomeWindowRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const HomePageImagePageView(),
          const SizedBox(height: 10),
          const Expanded(child: Center()),
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child:
                            Center(child: Image.asset(Assets.assetsTherapy))),
                    Expanded(
                      child: FilledButton.tonal(
                        style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => const BookTherapistPageRoute(),
                            ),
                          );
                        },
                        child: const Text(
                          "BOOK THERAPIST",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SwipeButton.expand(
            activeThumbColor: Theme.of(context).colorScheme.errorContainer,
            activeTrackColor: Theme.of(context).colorScheme.background,
            thumb: const Center(child: Text("CALL")),
            onSwipe: () {
              Fluttertoast.showToast(
                msg: "This feature is under development",
              );
            },
            child: const Text("EMERGENCY CONTACT"),
          ),
        ],
      ),
    );
  }
}
