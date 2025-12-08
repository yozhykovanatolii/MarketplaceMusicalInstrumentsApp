import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/theme/app_colors.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/listing/listing_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/listing/listing_event.dart';

class CategoryListFilterChip extends StatelessWidget {
  static const List<String> categories = [
    'Guitar',
    'Micro',
    'CAD',
    'MultiFx',
  ];
  const CategoryListFilterChip({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        childAspectRatio: 2.6,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        children: List<_CategoryFilterChip>.generate(
          categories.length,
          (index) => _CategoryFilterChip(
            category: categories[index],
          ),
        ),
      ),
    );
  }
}

class _CategoryFilterChip extends StatelessWidget {
  final String category;

  const _CategoryFilterChip({
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final isCategorySelected = context.select(
      (ListingBloc bloc) =>
          bloc.state.listingFilters.selectedCategories.contains(category),
    );
    return GestureDetector(
      onTap: () => context.read<ListingBloc>().add(
        ListingCategorySelectedEvent(category),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        decoration: BoxDecoration(
          color: isCategorySelected
              ? const Color(AppColors.kBlue)
              : Colors.grey[200],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            category,
            style: TextStyle(
              fontSize: MediaQuery.textScalerOf(context).scale(17),
              color: isCategorySelected ? Colors.white : Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
