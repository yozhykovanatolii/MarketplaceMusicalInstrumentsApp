import 'package:flutter/material.dart';
import 'package:marketplace_musical_instruments_app/core/widget/average_rating_section.dart';
import 'package:marketplace_musical_instruments_app/core/widget/category_listing_section.dart';

class CategoryAndAverageRatingSection extends StatelessWidget {
  final String listingCategory;

  const CategoryAndAverageRatingSection({
    super.key,
    required this.listingCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CategoryListingSection(
          category: listingCategory,
        ),
        const AverageRatingSection(),
      ],
    );
  }
}
