import 'package:flutter/material.dart';
import 'package:marketplace_musical_instruments_app/core/widget/average_rating_section.dart';
import 'package:marketplace_musical_instruments_app/core/widget/category_listing_section.dart';

class CategoryAndAverageRatingSection extends StatelessWidget {
  final String listingCategory;
  final double averageRating;
  final int reviewerCounter;

  const CategoryAndAverageRatingSection({
    super.key,
    required this.listingCategory,
    required this.averageRating,
    required this.reviewerCounter,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CategoryListingSection(
          category: listingCategory,
        ),
        AverageRatingSection(
          averageRating: averageRating,
          reviewerCounter: reviewerCounter,
        ),
      ],
    );
  }
}
