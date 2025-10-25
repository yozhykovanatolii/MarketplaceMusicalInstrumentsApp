import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/add_and_edit_listing/add_and_edit_listing_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/add_and_edit_listing/add_and_edit_listing_event.dart';

class CategoryDropdownMenu extends StatelessWidget {
  static const List<String> categories = [
    'Guitar',
    'Micro',
    'CAD',
    'MultiFx',
  ];
  const CategoryDropdownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: categories.first,
      onSelected: (category) => context.read<AddAndEditListingBloc>().add(
        ListingCategoryChangeEvent(category ?? 'Guitar'),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFFF6F6F6),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      menuStyle: MenuStyle(
        backgroundColor: const WidgetStatePropertyAll(
          Color(0xFFFAFAFA),
        ),
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
