import 'package:flutter/material.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/filter/widget/average_rating_filter_section.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/filter/widget/category_list_choice_chip.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/filter/widget/filter_actions_button_section.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/filter/widget/price_range_slider_section.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Filter',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Category',
              style: TextStyle(
                fontSize: MediaQuery.textScalerOf(context).scale(22),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const CategoryListFilterChip(),
            const SizedBox(height: 20),
            Text(
              'Price Range (Daily)',
              style: TextStyle(
                fontSize: MediaQuery.textScalerOf(context).scale(22),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const PriceRangeSliderSection(),
            const SizedBox(height: 10),
            Text(
              'Rating',
              style: TextStyle(
                fontSize: MediaQuery.textScalerOf(context).scale(22),
                fontWeight: FontWeight.bold,
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
