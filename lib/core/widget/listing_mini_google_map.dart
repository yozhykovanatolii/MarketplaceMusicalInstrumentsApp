import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ListingMiniGoogleMap extends StatefulWidget {
  final LatLng currentLocation;

  const ListingMiniGoogleMap({
    super.key,
    required this.currentLocation,
  });

  @override
  State<ListingMiniGoogleMap> createState() => _ListingMiniGoogleMapState();
}

class _ListingMiniGoogleMapState extends State<ListingMiniGoogleMap> {
  GoogleMapController? _controller;

  @override
  void didUpdateWidget(covariant ListingMiniGoogleMap oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.currentLocation != oldWidget.currentLocation) {
      _controller?.animateCamera(
        CameraUpdate.newLatLng(widget.currentLocation),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Material(
        elevation: 5,
        borderRadius: BorderRadiusGeometry.circular(15),
        clipBehavior: Clip.hardEdge,
        child: GoogleMap(
          onMapCreated: (controller) => _controller = controller,
          zoomControlsEnabled: false,
          myLocationButtonEnabled: false,
          circles: {
            Circle(
              circleId: const CircleId('blue_circle'),
              center: widget.currentLocation,
              radius: 300,
              fillColor: Colors.blue.withValues(alpha: 0.3),
              strokeColor: Colors.blue,
              strokeWidth: 2,
            ),
          },
          initialCameraPosition: CameraPosition(
            target: widget.currentLocation,
            zoom: 14,
          ),
        ),
      ),
    );
  }
}
