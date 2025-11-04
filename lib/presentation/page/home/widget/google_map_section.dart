import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapSection extends StatefulWidget {
  const GoogleMapSection({super.key});

  @override
  State<GoogleMapSection> createState() => _GoogleMapSectionState();
}

class _GoogleMapSectionState extends State<GoogleMapSection> {
  static const CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return const GoogleMap(
      zoomControlsEnabled: false,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      initialCameraPosition: initialCameraPosition,
    );
  }
}
