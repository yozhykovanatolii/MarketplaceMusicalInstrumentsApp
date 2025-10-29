import 'package:flutter/material.dart';
import 'package:marketplace_musical_instruments_app/generated/l10n.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/filter/widget/average_rating_filter_section.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/filter/widget/category_list_choice_chip.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/filter/widget/filter_actions_button_section.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/filter/widget/price_range_slider_section.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.only(top: 196),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(
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
                S.of(context).filterBy,
                style: TextStyle(
                  fontSize: MediaQuery.textScalerOf(context).scale(24),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              S.of(context).category,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 10),
            const CategoryListFilterChip(),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 15),
            Text(
              S.of(context).priceRangeDaily,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 10),
            const PriceRangeSliderSection(),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            Text(
              S.of(context).rating,
              style: Theme.of(context).textTheme.labelLarge,
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
