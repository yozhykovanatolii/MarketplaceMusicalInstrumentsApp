import 'package:flutter/material.dart';

class RatingSummaryIndicator extends StatelessWidget {
  final String text;
  final double value;

  const RatingSummaryIndicator({
    super.key,
    required this.text,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: MediaQuery.textScalerOf(context).scale(18),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 5),
        const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: LinearProgressIndicator(
            value: value,
            minHeight: 10,
            backgroundColor: Colors.grey[300],
            color: const Color(0xFF007DFC),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ],
    );
  }
}
