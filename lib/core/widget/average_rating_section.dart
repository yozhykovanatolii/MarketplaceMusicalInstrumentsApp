import 'package:flutter/material.dart';

class AverageRatingSection extends StatelessWidget {
  const AverageRatingSection({super.key});

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
            text: '4.9 ',
            style: TextStyle(
              fontSize: MediaQuery.textScalerOf(context).scale(17),
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            children: [
              const TextSpan(
                text: '(2152)',
                style: TextStyle(
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
