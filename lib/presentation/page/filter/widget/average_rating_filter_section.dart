import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/listing/listing_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/listing/listing_event.dart';

class AverageRatingFilterSection extends StatelessWidget {
  const AverageRatingFilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      children: List.generate(
        5,
        (index) => Expanded(
          child: _RatingCardButton(
            rating: index + 1,
          ),
        ),
      ),
    );
  }
}

class _RatingCardButton extends StatelessWidget {
  final int rating;

  const _RatingCardButton({
    super.key,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
        decoration: BoxDecoration(
          color: const Color(0xFF007DFC),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$rating',
                style: TextStyle(
                  fontSize: MediaQuery.textScalerOf(context).scale(17),
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Icon(
                Icons.star,
                color: Colors.amber,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
