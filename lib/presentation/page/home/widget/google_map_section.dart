import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/listing/listing_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/listing/listing_event.dart';

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
  BitmapDescriptor customIcon = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    _addCustomIconMarker();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant GoogleMapSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.currentLocation != oldWidget.currentLocation) {
      _controller?.animateCamera(
        CameraUpdate.newLatLng(widget.currentLocation),
      );
    }
  }

  Future<void> _addCustomIconMarker() async {
    final icon = await BitmapDescriptor.asset(
      const ImageConfiguration(),
      'assets/images/price_marker.png',
    );
    setState(() {
      customIcon = icon;
    });
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
      onMapCreated: (controller) => _controller ??= controller,
      initialCameraPosition: CameraPosition(
        target: widget.currentLocation,
        zoom: 13,
      ),
      onCameraMove: (position) {
        context.read<ListingBloc>().add(
          LocationChangedEvent(
            position.target.latitude,
            position.target.longitude,
          ),
        );
      },
      onCameraIdle: () {
        context.read<ListingBloc>().add(ListingFilterEvent());
      },
      markers: listings
          .map(
            (listing) => Marker(
              markerId: MarkerId(listing.id),
              position: LatLng(
                listing.location['latitude']!,
                listing.location['longitude']!,
              ),
              icon: customIcon,
            ),
          )
          .toSet(),
    );
  }
}
