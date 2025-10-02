import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:marketplace_musical_instruments_app/core/widget/average_rating_section.dart';
import 'package:marketplace_musical_instruments_app/core/widget/listing_mini_google_map.dart';

class AboutSection extends StatelessWidget {
  final Map<String, double> location;

  const AboutSection({
    super.key,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Author',
            style: TextStyle(
              fontSize: MediaQuery.textScalerOf(context).scale(18),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const _AuthorSubSection(),
          const SizedBox(height: 20),
          Text(
            'Description',
            style: TextStyle(
              fontSize: MediaQuery.textScalerOf(context).scale(18),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: MediaQuery.textScalerOf(context).scale(17),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Location',
            style: TextStyle(
              fontSize: MediaQuery.textScalerOf(context).scale(18),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Location',
            style: TextStyle(
              fontSize: MediaQuery.textScalerOf(context).scale(17),
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListingMiniGoogleMap(
              currentLocation: LatLng(
                location['latitude'] ?? 37.42796133580664,
                location['longitude'] ?? -122.085749655962,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AuthorSubSection extends StatelessWidget {
  const _AuthorSubSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 10,
          children: [
            const SizedBox(
              height: 80,
              width: 80,
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/test.jpg',
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Yozhykov Andrey',
                  style: TextStyle(
                    fontSize: MediaQuery.textScalerOf(context).scale(17),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const AverageRatingSection(),
              ],
            ),
          ],
        ),
        IconButton.filled(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.grey[200]),
          ),
          icon: const Icon(
            Iconsax.call,
            size: 30,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
