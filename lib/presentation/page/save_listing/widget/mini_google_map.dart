import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:marketplace_musical_instruments_app/core/widget/get_user_location_button.dart';
import 'package:marketplace_musical_instruments_app/core/widget/listing_mini_google_map.dart';
import 'package:marketplace_musical_instruments_app/domain/entity/location_entity.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/save_listing/save_listing_cubit.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/save_listing/save_listing_state.dart';

class MiniGoogleMap extends StatelessWidget {
  const MiniGoogleMap({super.key});

  @override
  Widget build(BuildContext context) {
    print('MiniGoogleMap rebuilt');
    return Stack(
      children: [
        BlocSelector<SaveListingCubit, SaveListingState, LocationEntity>(
          selector: (state) => state.currentLocation,
          builder: (context, userCurrentLocation) {
            final locationKey =
                '${userCurrentLocation.latitude.toStringAsFixed(6)}_'
                '${userCurrentLocation.longitude.toStringAsFixed(6)}';
            return ListingMiniGoogleMap(
              key: ValueKey(locationKey),
              currentLocation: LatLng(
                userCurrentLocation.latitude,
                userCurrentLocation.longitude,
              ),
            );
          },
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: GetUserLocationButton(
            onPressed: () =>
                context.read<SaveListingCubit>().onGetUserLocation(),
          ),
        ),
      ],
    );
  }
}
