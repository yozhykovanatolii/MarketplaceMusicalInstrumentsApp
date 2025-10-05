import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AverageRatingBar extends StatelessWidget {
  const AverageRatingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      initialRating: 4.9,
      minRating: 1,
      maxRating: 5,
      itemSize: 30,
      ratingWidget: RatingWidget(
        full: const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        half: const Icon(
          Icons.star_half,
          color: Colors.amber,
        ),
        empty: Icon(
          Icons.star,
          color: Colors.grey[300],
        ),
      ),
      onRatingUpdate: (value) {},
    );
  }
}
