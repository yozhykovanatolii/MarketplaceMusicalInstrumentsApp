import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:marketplace_musical_instruments_app/generated/l10n.dart';

class RatingSection extends StatelessWidget {
  final double rating;
  final int reviewerCounter;

  const RatingSection({
    super.key,
    required this.rating,
    required this.reviewerCounter,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$rating',
          style: TextStyle(
            fontSize: MediaQuery.textScalerOf(context).scale(40),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          S.of(context).reviewercounterReviews(reviewerCounter),
          style: Theme.of(context).textTheme.labelMedium,
        ),
        RatingBarIndicator(
          rating: rating,
          itemSize: 30,
          itemBuilder: (BuildContext context, int index) {
            return const Icon(
              Icons.star,
              color: Colors.amber,
            );
          },
        ),
      ],
    );
  }
}
