import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/favourite_listings/favourite_listings_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/favourite_listings/favourite_listings_event.dart';

class FavouriteButton extends StatelessWidget {
  final String listingId;

  const FavouriteButton({
    super.key,
    required this.listingId,
  });

  @override
  Widget build(BuildContext context) {
    final isFavourite = context.select(
      (FavouriteListingsBloc bloc) =>
          bloc.state.favouriteListingsId.contains(listingId),
    );
    return IconButton.filled(
      onPressed: () {
        context.read<FavouriteListingsBloc>().add(
          FavouriteListingAddEvent(listingId),
        );
        context.read<FavouriteListingsBloc>().add(
          FavouriteListingsFetchEvent(),
        );
      },
      style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.white),
      ),
      icon: Icon(
        isFavourite ? Iconsax.heart : Iconsax.heart_copy,
        color: isFavourite ? Colors.red : Colors.black,
      ),
    );
  }
}
