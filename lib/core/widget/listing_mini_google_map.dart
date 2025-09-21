import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ListingMiniGoogleMap extends StatelessWidget {
  const ListingMiniGoogleMap({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Material(
        elevation: 5,
        borderRadius: BorderRadiusGeometry.circular(15),
        clipBehavior: Clip.hardEdge,
        child: const GoogleMap(
          zoomControlsEnabled: false,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          initialCameraPosition: CameraPosition(
            target: LatLng(37.42796133580664, -122.085749655962),
            zoom: 14,
          ),
        ),
      ),
    );
  }
}
