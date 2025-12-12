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
  LatLng? _pendingTarget;

  @override
  void didUpdateWidget(covariant ListingMiniGoogleMap oldWidget) {
    super.didUpdateWidget(oldWidget);
    final changed =
        widget.currentLocation.latitude != oldWidget.currentLocation.latitude ||
        widget.currentLocation.longitude != oldWidget.currentLocation.longitude;
    if (!changed) return;
    if (_controller == null) {
      _pendingTarget = widget.currentLocation;
    } else {
      _controller!.animateCamera(
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
          onMapCreated: (GoogleMapController controller) {
            _controller = controller;
            if (_pendingTarget != null) {
              _controller!.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: _pendingTarget!,
                    zoom: 14,
                  ),
                ),
              );
              _pendingTarget = null;
            }
          },
          circles: {
            Circle(
              circleId: const CircleId('listing_circle'),
              center: widget.currentLocation,
              radius: 300, // в метрах
              strokeWidth: 2,
              strokeColor: Colors.blue,
              fillColor: Colors.blue.withValues(alpha: 0.2),
            ),
          },
          zoomControlsEnabled: false,
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          initialCameraPosition: CameraPosition(
            target: widget.currentLocation,
            zoom: 14,
          ),
        ),
      ),
    );
  }
}
