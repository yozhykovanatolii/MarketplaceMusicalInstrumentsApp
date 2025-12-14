import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/constants/app_constant.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/save_listing/save_listing_cubit.dart';

class CategoryDropdownMenu extends StatelessWidget {
  const CategoryDropdownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = AppConstant.categories;
    return DropdownMenu<String>(
      initialSelection: categories.first,
      onSelected: (category) => context
          .read<SaveListingCubit>()
          .onCategoryChanged(category ?? 'Guitar'),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFFF6F6F6),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      menuStyle: MenuStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(12),
          ),
        ),
      ),
      dropdownMenuEntries: categories.map<DropdownMenuEntry<String>>(
        (String category) {
          return DropdownMenuEntry(
            value: category,
            label: category,
          );
        },
      ).toList(),
    );
  }
}
