import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapSection extends StatefulWidget {
  final LatLng currentLocation;

  const GoogleMapSection({
    super.key,
    required this.currentLocation,
  });

  @override
  State<GoogleMapSection> createState() => _GoogleMapSectionState();
}

class _GoogleMapSectionState extends State<GoogleMapSection> {
  GoogleMapController? _controller;

  @override
  void didUpdateWidget(covariant GoogleMapSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.currentLocation != oldWidget.currentLocation) {
      _controller?.animateCamera(
        CameraUpdate.newLatLng(widget.currentLocation),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      zoomControlsEnabled: false,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      onMapCreated: (controller) => _controller = controller,
      initialCameraPosition: CameraPosition(
        target: widget.currentLocation,
        zoom: 13,
      ),
    );
  }
}
