import 'package:flutter/material.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/filter/widget/average_rating_filter_section.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/filter/widget/category_list_choice_chip.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/filter/widget/filter_actions_button_section.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/filter/widget/price_range_slider_section.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      margin: const EdgeInsets.only(top: 60),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Center(
              child: Text(
                'Filter by',
                style: TextStyle(
                  fontSize: MediaQuery.textScalerOf(context).scale(24),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'Category',
              style: TextStyle(
                fontSize: MediaQuery.textScalerOf(context).scale(20),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            const CategoryListFilterChip(),
            const SizedBox(height: 15),
            const Divider(),
            const SizedBox(height: 15),
            Text(
              'Price Range (Daily)',
              style: TextStyle(
                fontSize: MediaQuery.textScalerOf(context).scale(20),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            const PriceRangeSliderSection(),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            Text(
              'Rating',
              style: TextStyle(
                fontSize: MediaQuery.textScalerOf(context).scale(20),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            const AverageRatingFilterSection(),
            const FilterActionsButtonSection(),
          ],
        ),
      ),
    );
  }
}
