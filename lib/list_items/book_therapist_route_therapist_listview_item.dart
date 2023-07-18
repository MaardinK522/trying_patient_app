import 'package:flutter/material.dart';

import '../models/therapist_listitem.dart';
import '../routes/therapist_details_page_route.dart';

class BookTherapistRouteTherapistListViewItem extends StatelessWidget {
  final TherapistListItemModel therapist;

  const BookTherapistRouteTherapistListViewItem({
    Key? key,
    required this.therapist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TherapistDetailsPageRoute(
                index: therapist.index,
                therapistImage: therapist.therapistImage,
                therapistName: therapist.therapistName,
              ),
            ));
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 20),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 2,
            color: Theme.of(context).colorScheme.primary,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Hero(
                tag: "${therapist.therapistImage}${therapist.index}",
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
                      tag: "${therapist.therapistName}${therapist.index}",
                      child: Material(
                        color: Colors.transparent,
                        child: Text(
                          therapist.therapistName,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      "PhysioTherapist",
                      style: TextStyle(
                        fontSize: 15,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
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
