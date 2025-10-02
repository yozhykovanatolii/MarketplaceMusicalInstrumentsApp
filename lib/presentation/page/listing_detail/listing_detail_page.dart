import 'package:flutter/material.dart';
import 'package:marketplace_musical_instruments_app/data/model/listing_model.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/listing_detail/widget/category_and_average_rating_section.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/listing_detail/widget/photo_listing_section.dart';

class ListingDetailPage extends StatelessWidget {
  final ListingModel listing;

  const ListingDetailPage({
    super.key,
    required this.listing,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(vertical: 40),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PhotoListingSection(
                photos: listing.photos,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  spacing: 10,
                  children: [
                    CategoryAndAverageRatingSection(
                      listingCategory: listing.category,
                    ),
                    Text(
                      'Prepared Hero Emergency Fire Blanket 303',
                      style: TextStyle(
                        fontSize: MediaQuery.textScalerOf(context).scale(22),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
