import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:marketplace_musical_instruments_app/core/localization/generated/l10n.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/listing/listing_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/listing/listing_event.dart';

class DistanceSection extends StatelessWidget {
  const DistanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).distance,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 10,
          children: [
            _DistanceActionButton(
              isIncreasing: false,
            ),
            _DistanceResultSection(),
            _DistanceActionButton(),
          ],
        ),
      ],
    );
  }
}

class _DistanceResultSection extends StatelessWidget {
  const _DistanceResultSection();

  @override
  Widget build(BuildContext context) {
    final distance = context.select(
      (ListingBloc bloc) => bloc.state.listingFilters.distance,
    );
    return Text(
      S.of(context).distanceKm(distance),
      style: TextStyle(
        fontSize: MediaQuery.textScalerOf(context).scale(18),
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class _DistanceActionButton extends StatelessWidget {
  final bool isIncreasing;

  const _DistanceActionButton({
    this.isIncreasing = true,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      onPressed: () => context.read<ListingBloc>().add(
        isIncreasing ? DistanceIncreaseEvent() : DistanceDecreaseEvent(),
      ),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      child: Icon(
        isIncreasing ? Iconsax.add_copy : Iconsax.minus_copy,
      ),
    );
  }
}
