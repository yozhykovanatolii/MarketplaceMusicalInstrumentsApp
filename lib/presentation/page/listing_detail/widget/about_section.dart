import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:marketplace_musical_instruments_app/core/theme/app_colors.dart';
import 'package:marketplace_musical_instruments_app/core/widget/listing_mini_google_map.dart';
import 'package:marketplace_musical_instruments_app/domain/entity/location_entity.dart';
import 'package:marketplace_musical_instruments_app/generated/l10n.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/booking_save/booking_save_cubit.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/listing_detail/widget/read_more_text.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/listing_detail/widget/user_avatar_and_full_name.dart';

class AboutSection extends StatelessWidget {
  final LocationEntity location;
  final String listingDescription;
  final String authorFullName;
  final String authorAvatar;
  final String authorPhoneNumber;

  const AboutSection({
    super.key,
    required this.location,
    required this.listingDescription,
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
            S.of(context).author,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 10),
          _AuthorSubSection(
            authorAvatar: authorAvatar,
            authorFullName: authorFullName,
            authorPhoneNumber: authorPhoneNumber,
          ),
          const SizedBox(height: 20),
          Text(
            S.of(context).description,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 10),
          ReadMoreText(text: listingDescription),
          const SizedBox(height: 20),
          Text(
            S.of(context).location,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListingMiniGoogleMap(
              currentLocation: LatLng(
                location.latitude,
                location.longitude,
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
            context.read<BookingSaveCubit>().openCallDialer(authorPhoneNumber);
          },
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.grey[200]),
          ),
          icon: const Icon(
            Iconsax.call,
            size: 30,
            color: Color(AppColors.kBlue),
          ),
        ),
      ],
    );
  }
}
