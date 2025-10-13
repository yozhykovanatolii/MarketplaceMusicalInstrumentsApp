import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/review/review_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/review/review_event.dart';

class AverageRatingBar extends StatelessWidget {
  const AverageRatingBar({super.key});

  @override
  Widget build(BuildContext context) {
    final rating = context.select(
      (ReviewBloc bloc) => bloc.state.rating,
    );
    return RatingBar(
      initialRating: rating,
      minRating: 0,
      maxRating: 5,
      itemSize: 36,
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
      onRatingUpdate: (newRating) {
        context.read<ReviewBloc>().add(
          AverageRatingChangeEvent(newRating),
        );
      },
    );
  }
}
