import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/listing/listing_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/listing_detail/listing_detail_page.dart';

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

  void _onCameraIdle() {
    print('Camera stopped');
  }

  @override
  Widget build(BuildContext context) {
    final listings = context.select(
      (ListingBloc bloc) => bloc.state.listings,
    );
    return GoogleMap(
      zoomControlsEnabled: false,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      onMapCreated: (controller) => _controller = controller,
      initialCameraPosition: CameraPosition(
        target: widget.currentLocation,
        zoom: 13,
      ),
      onCameraMove: (position) {
        print('Camera moved');
      },
      onCameraIdle: _onCameraIdle,
      markers: listings
          .map(
            (listing) => Marker(
              markerId: MarkerId(listing.id),
              position: LatLng(
                listing.location['latitude']!,
                listing.location['longitude']!,
              ),
              icon: BitmapDescriptor.defaultMarker,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ListingDetailPage(listing: listing),
                  ),
                );
              },
            ),
          )
          .toSet(),
    );
  }
}
