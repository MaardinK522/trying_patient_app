import 'package:flutter/material.dart';
import 'package:phyzzicare/models/therapist_model.dart';

class TherapistDetailsPageRoute extends StatelessWidget {
  final TherapistModel item;

  const TherapistDetailsPageRoute({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: item.therapistName,
          child: Material(
            color: Colors.transparent,
            child: Text(item.therapistName,
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
            tag: item.therapistImage,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(item.therapistImage),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
