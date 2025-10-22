import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:marketplace_musical_instruments_app/core/widget/listing_mini_google_map.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/booking_save/booking_save_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/booking_save/booking_save_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/listing_detail/widget/read_more_text.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/listing_detail/widget/user_avatar_and_full_name.dart';

class AboutSection extends StatelessWidget {
  final Map<String, double> location;
  final String authorFullName;
  final String authorAvatar;
  final String authorPhoneNumber;

  const AboutSection({
    super.key,
    required this.location,
    required this.authorAvatar,
    required this.authorFullName,
    required this.authorPhoneNumber,
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
          _AuthorSubSection(
            authorAvatar: authorAvatar,
            authorFullName: authorFullName,
            authorPhoneNumber: authorPhoneNumber,
          ),
          const SizedBox(height: 20),
          Text(
            'Description',
            style: TextStyle(
              fontSize: MediaQuery.textScalerOf(context).scale(18),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const ReadMoreText(
            text:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
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
  final String authorFullName;
  final String authorAvatar;
  final String authorPhoneNumber;

  const _AuthorSubSection({
    super.key,
    required this.authorAvatar,
    required this.authorFullName,
    required this.authorPhoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        UserAvatarAndFullName(
          authorAvatar: authorAvatar,
          authorFullName: authorFullName,
        ),
        IconButton.filled(
          onPressed: () {
            context.read<BookingSaveBloc>().add(
              OpenCallDialerEvent(authorPhoneNumber),
            );
          },
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.grey[200]),
          ),
          icon: const Icon(
            Iconsax.call,
            size: 30,
            color: Color(0xFF007DFC),
          ),
        ),
      ],
    );
  }
}
