import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/listing/listing_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/listing/listing_event.dart';

class AverageRatingFilterSection extends StatelessWidget {
  const AverageRatingFilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedAverageRating = context.select(
      (ListingBloc bloc) => bloc.state.selectedAverageRating,
    );
    return RadioGroup<int>(
      groupValue: selectedAverageRating,
      onChanged: (value) => context.read<ListingBloc>().add(
        AverageRatingListingClickedEvent(value),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _RatingRadioButton(value: 5),
          _RatingRadioButton(value: 4),
          _RatingRadioButton(value: 3),
          _RatingRadioButton(value: 2),
          _RatingRadioButton(value: 1),
        ],
      ),
    );
  }
}

class _RatingRadioButton extends StatelessWidget {
  final int value;

  const _RatingRadioButton({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      visualDensity: const VisualDensity(
        horizontal: VisualDensity.minimumDensity,
        vertical: VisualDensity.minimumDensity,
      ),
      leading: Radio<int>(
        value: value,
        visualDensity: const VisualDensity(
          horizontal: VisualDensity.minimumDensity,
          vertical: VisualDensity.minimumDensity,
        ),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        activeColor: const Color(0xFF007DFC),
      ),
      title: RatingBarIndicator(
        rating: value.toDouble(),
        itemSize: 35,
        unratedColor: Colors.grey[300],
        itemBuilder: (BuildContext context, int index) {
          return const Icon(
            Icons.star,
            color: Colors.amber,
          );
        },
      ),
    );
  }
}
