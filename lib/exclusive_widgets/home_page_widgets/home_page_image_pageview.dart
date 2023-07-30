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
    viewportFraction: 1,
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
    imagesPageViewController.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
          child: PageView.builder(
            controller: imagesPageViewController,
            // physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Image.asset(
                Assets.assetsGhandi,
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        SmoothPageIndicator(
          controller: imagesPageViewController,
          count: 5,
          effect: ScrollingDotsEffect(
            dotHeight: 10,
            dotWidth: 10,
            activeDotScale: 1.75,
            activeDotColor: Theme.of(context).colorScheme.secondary,
            dotColor: Colors.grey,
            // dotColor: Theme.of(context).colorScheme.tertiary,
          ),
        ),
      ],
    );
  }
}
