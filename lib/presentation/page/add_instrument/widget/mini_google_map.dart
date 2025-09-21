import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:marketplace_musical_instruments_app/core/widget/listing_mini_google_map.dart';

class MiniGoogleMap extends StatelessWidget {
  const MiniGoogleMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ListingMiniGoogleMap(),
        Positioned(
          right: 10,
          bottom: 10,
          child: FloatingActionButton(
            onPressed: () {},
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
