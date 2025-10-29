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
            style: Theme.of(context).textTheme.bodyMedium,
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
