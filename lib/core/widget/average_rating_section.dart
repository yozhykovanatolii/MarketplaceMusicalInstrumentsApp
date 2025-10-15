import 'package:flutter/material.dart';

class AverageRatingSection extends StatelessWidget {
  final double averageRating;
  final int reviewerCounter;

  const AverageRatingSection({
    super.key,
    required this.averageRating,
    required this.reviewerCounter,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          size: 27,
          color: Colors.amber,
        ),
        RichText(
          text: TextSpan(
            text: '$averageRating ',
            style: TextStyle(
              fontSize: MediaQuery.textScalerOf(context).scale(17),
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            children: [
              TextSpan(
                text: '($reviewerCounter)',
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
