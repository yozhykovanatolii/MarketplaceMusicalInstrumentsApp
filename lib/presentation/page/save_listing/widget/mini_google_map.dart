import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:marketplace_musical_instruments_app/core/widget/listing_mini_google_map.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/add_and_edit_listing/add_and_edit_listing_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/add_and_edit_listing/add_and_edit_listing_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/add_and_edit_listing/add_and_edit_listing_state.dart';

class MiniGoogleMap extends StatelessWidget {
  const MiniGoogleMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocSelector<
          AddAndEditListingBloc,
          AddAndEditListingState,
          Map<String, double>
        >(
          selector: (state) => state.currentLocation,
          builder: (context, userCurrentLocation) {
            return ListingMiniGoogleMap(
              currentLocation: LatLng(
                userCurrentLocation['latitude'] ?? 37.42796133580664,
                userCurrentLocation['longitude'] ?? -122.085749655962,
              ),
            );
          },
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: FloatingActionButton(
            onPressed: () => context.read<AddAndEditListingBloc>().add(
              GetUserCurrentLocationEvent(),
            ),
            backgroundColor: Colors.white,
            foregroundColor: Colors.blue,
            shape: const CircleBorder(),
            child: const Icon(
              Iconsax.gps,
            ),
          ),
        ),
      ],
    );
  }
}
