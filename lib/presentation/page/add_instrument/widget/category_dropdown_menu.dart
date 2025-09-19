import 'package:flutter/material.dart';

class CategoryDropdownMenu extends StatelessWidget {
  static const List<String> categories = [
    'Guitar',
    'Microphone',
    'CAD',
    'Multi-Effect Unit',
  ];
  const CategoryDropdownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: categories.first,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFFFAFAFA),
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
