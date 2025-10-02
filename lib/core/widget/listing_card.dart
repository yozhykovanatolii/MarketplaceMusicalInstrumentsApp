import 'package:flutter/material.dart';
import 'package:marketplace_musical_instruments_app/core/widget/average_rating_section.dart';
import 'package:marketplace_musical_instruments_app/core/widget/favourite_button.dart';
import 'package:marketplace_musical_instruments_app/data/model/listing_model.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/add_instrument/add_and_edit_instrument_page.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/listing_detail/listing_detail_page.dart';
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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddAndEditInstrumentPage(
                listing: listing,
              ),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ListingDetailPage(
                listing: listing,
              ),
            ),
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
    super.key,
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
              : const FavouriteButton(),
        ),
      ],
    );
  }
}

class _ShortDescriptionSection extends StatelessWidget {
  final String title;
  final int price;

  const _ShortDescriptionSection({
    super.key,
    required this.title,
    required this.price,
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
            'Prepared Hero Emergency Fire Blanket 303',
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
          const AverageRatingSection(),
        ],
      ),
    );
  }
}
