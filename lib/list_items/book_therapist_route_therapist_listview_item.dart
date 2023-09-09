import 'package:flutter/material.dart';

import '../models/therapist_model.dart';
import '../routes/therapist_details_page_route.dart';

class BookTherapistRouteTherapistListViewItem extends StatelessWidget {
  final TherapistModel therapist;
  final int rating;

  const BookTherapistRouteTherapistListViewItem({
    Key? key,
    required this.therapist,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TherapistDetailsPageRoute(
              item: therapist,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Hero(
              tag: "${therapist.therapistImage}${therapist.therapistID}",
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(therapist.therapistImage),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Hero(
                    tag: therapist.therapistName,
                    child: Material(
                      color: Colors.transparent,
                      child: Text(
                        therapist.therapistName,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    "PhysioTherapist",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w200,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
