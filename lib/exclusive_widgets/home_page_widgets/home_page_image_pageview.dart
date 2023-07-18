import 'dart:async';

import 'package:flutter/material.dart';
import 'package:phyzzicare/generated/assets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePageImagePageView extends StatefulWidget {
  const HomePageImagePageView({Key? key}) : super(key: key);

  @override
  State<HomePageImagePageView> createState() => _HomePageImagePageViewState();
}

class _HomePageImagePageViewState extends State<HomePageImagePageView> {
  final PageController imagesPageViewController = PageController(
    keepPage: true,
    viewportFraction: 0.9,
  );

  late Timer timer;

  @override
  void initState() {
    timer = Timer(const Duration(seconds: 2), () {
      imagesPageViewController.nextPage(
        duration: const Duration(milliseconds: 600),
        curve: Curves.ease,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 150,
            child: PageView.builder(
              controller: imagesPageViewController,
              // physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 150,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(Assets.assetsGhandi),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          SmoothPageIndicator(
            controller: imagesPageViewController,
            count: 5,
            effect: ScrollingDotsEffect(
              activeDotScale: 1.5,
              activeDotColor: Theme.of(context).colorScheme.secondary,
              dotColor: Colors.grey,
              // dotColor: Theme.of(context).colorScheme.tertiary,
            ),
          ),
        ],
      ),
    );
  }
}
