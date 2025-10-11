import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/listing/listing_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/listing/listing_event.dart';

class CategoryListFilterChip extends StatelessWidget {
  static const List<String> categories = [
    'Guitar',
    'Microphone',
    'CAD',
    'Multi-Effect Unit',
  ];
  const CategoryListFilterChip({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
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
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final isCategorySelected = context.select(
      (ListingBloc bloc) => bloc.state.selectedCategories.contains(category),
    );
    return GestureDetector(
      onTap: () => context.read<ListingBloc>().add(
        ListingCategorySelectedEvent(category),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        margin: const EdgeInsets.symmetric(horizontal: 3),
        decoration: BoxDecoration(
          color: isCategorySelected
              ? const Color(0xFF007DFC)
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
