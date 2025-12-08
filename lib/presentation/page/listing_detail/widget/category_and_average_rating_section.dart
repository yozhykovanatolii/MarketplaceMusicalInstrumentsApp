import 'package:flutter/material.dart';
import 'package:marketplace_musical_instruments_app/core/theme/app_colors.dart';
import 'package:marketplace_musical_instruments_app/core/widget/average_rating_section.dart';
import 'package:marketplace_musical_instruments_app/core/widget/tag_container.dart';

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
        TagContainer(
          text: listingCategory,
          fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
          colorContainer: Colors.grey[200],
          fontWeight: Theme.of(context).textTheme.bodyMedium?.fontWeight,
          colorText: const Color(AppColors.kBlue),
        ),
        AverageRatingSection(
          averageRating: averageRating,
          reviewerCounter: reviewerCounter,
        ),
      ],
    );
  }
}
