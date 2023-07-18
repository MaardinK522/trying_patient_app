import 'package:flutter/material.dart';

class TherapistDetailsPageRoute extends StatelessWidget {
  final String therapistImage;
  final String therapistName;
  final int index;

  const TherapistDetailsPageRoute(
      {super.key,
      required this.therapistImage,
      required this.therapistName,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: "$therapistName$index",
          child: Material(
            color: Colors.transparent,
            child: Text(therapistName,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  overflow: TextOverflow.ellipsis,
                )),
          ),
        ),
      ),
      body: ListView(
        children: [
          Hero(
            tag: "$therapistImage$index",
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(therapistImage),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
