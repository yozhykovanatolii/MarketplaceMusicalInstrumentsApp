import 'package:flutter/material.dart';
import 'package:marketplace_musical_instruments_app/data/model/listing_model.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/listing_detail/widget/about_section.dart';
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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
                const SizedBox(height: 10),
                TabBar(
                  indicatorColor: Colors.blue,
                  labelColor: Colors.blue,
                  indicatorWeight: 4,
                  labelStyle: TextStyle(
                    fontSize: MediaQuery.textScalerOf(context).scale(17),
                    fontWeight: FontWeight.w500,
                  ),
                  tabs: const [
                    Tab(text: 'About'),
                    Tab(text: 'Calendar'),
                    Tab(text: 'Reviews'),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: TabBarView(
                    children: [
                      AboutSection(
                        location: listing.location,
                      ),
                      const Icon(Icons.directions_transit),
                      const Icon(Icons.directions_bike),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
