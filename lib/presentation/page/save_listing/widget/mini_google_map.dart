import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:marketplace_musical_instruments_app/core/widget/get_user_location_button.dart';
import 'package:marketplace_musical_instruments_app/core/widget/listing_mini_google_map.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/save_listing/save_listing_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/save_listing/save_listing_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/save_listing/save_listing_state.dart';

class MiniGoogleMap extends StatelessWidget {
  const MiniGoogleMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocSelector<SaveListingBloc, SaveListingState, Map<String, double>>(
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
          child: GetUserLocationButton(
            onPressed: () => context.read<SaveListingBloc>().add(
              GetUserCurrentLocationEvent(),
            ),
          ),
        ),
      ],
    );
  }
}
