import 'package:flutter/material.dart';
import 'package:marketplace_musical_instruments_app/core/widget/average_rating_section.dart';

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
        _CategorySection(
          category: listingCategory,
        ),
        const AverageRatingSection(),
      ],
    );
  }
}

class _CategorySection extends StatelessWidget {
  final String category;

  const _CategorySection({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          category,
          style: TextStyle(
            fontSize: MediaQuery.textScalerOf(context).scale(17),
            color: Colors.blue,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
