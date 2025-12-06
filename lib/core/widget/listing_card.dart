import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketplace_musical_instruments_app/core/navigation/app_routes.dart';
import 'package:marketplace_musical_instruments_app/core/widget/average_rating_section.dart';
import 'package:marketplace_musical_instruments_app/core/widget/favourite_button.dart';
import 'package:marketplace_musical_instruments_app/data/model/listing_model.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/my_listings/widget/delete_listing_button.dart';

class ListingCard extends StatelessWidget {
  final ListingModel listing;
  final bool isEditing;

  const ListingCard({
    super.key,
    required this.listing,
    this.isEditing = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isEditing) {
          context.push(
            AppRoutes.saveListingPage,
            extra: listing,
          );
        } else {
          context.push(
            AppRoutes.listingsDetailPage,
            extra: listing,
          );
        }
      },
      child: Card(
        elevation: 7,
        child: Column(
          spacing: 5,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _PhotoSectionCard(
              imageUrl: listing.photos.first,
              listingId: listing.id,
              isEditing: isEditing,
            ),
            Flexible(
              child: _ShortDescriptionSection(
                title: listing.title,
                price: listing.priceByHour,
                averageRating: listing.averageRating,
                reviewerCounter: listing.reviewerCount,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PhotoSectionCard extends StatelessWidget {
  final String imageUrl;
  final String listingId;
  final bool isEditing;

  const _PhotoSectionCard({
    required this.imageUrl,
    required this.listingId,
    required this.isEditing,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 1.12,
          child: ClipRRect(
            borderRadius: BorderRadiusDirectional.circular(15),
            child: Image.network(
              imageUrl,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          right: 3,
          child: isEditing
              ? DeleteListingButton(listingId: listingId)
              : FavouriteButton(listingId: listingId),
        ),
      ],
    );
  }
}

class _ShortDescriptionSection extends StatelessWidget {
  final String title;
  final int price;
  final double averageRating;
  final int reviewerCounter;

  const _ShortDescriptionSection({
    required this.title,
    required this.price,
    required this.averageRating,
    required this.reviewerCounter,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 2,
        children: [
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: MediaQuery.textScalerOf(context).scale(15),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '\$$price',
            style: TextStyle(
              fontSize: MediaQuery.textScalerOf(context).scale(23),
              fontWeight: FontWeight.bold,
            ),
          ),
          AverageRatingSection(
            averageRating: averageRating,
            reviewerCounter: reviewerCounter,
          ),
        ],
      ),
    );
  }
}
