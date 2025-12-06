import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/listing/listing_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/listing/listing_event.dart';

class PriceRangeSliderSection extends StatelessWidget {
  const PriceRangeSliderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final startPrice = context.select(
      (ListingBloc bloc) => bloc.state.listingFilters.startPrice,
    );
    final endPrice = context.select(
      (ListingBloc bloc) => bloc.state.listingFilters.endPrice,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Text(
          '\$$startPrice - \$$endPrice',
          style: TextStyle(
            fontSize: MediaQuery.textScalerOf(context).scale(18),
            fontWeight: FontWeight.w500,
          ),
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: const Color(0xFF007DFC),
            inactiveTrackColor: Colors.grey[300],
            thumbColor: const Color(0xFF007DFC),
            overlayShape: SliderComponentShape.noOverlay,
            trackHeight: 6,
          ),
          child: RangeSlider(
            values: RangeValues(
              startPrice.toDouble(),
              endPrice.toDouble(),
            ),
            max: 500,
            onChanged: (values) => context.read<ListingBloc>().add(
              PriceRangeSelectedEvent(values.start, values.end),
            ),
          ),
        ),
      ],
    );
  }
}
