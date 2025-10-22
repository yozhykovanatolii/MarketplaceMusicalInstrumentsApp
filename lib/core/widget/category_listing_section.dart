import 'package:flutter/material.dart';

class CategoryListingSection extends StatelessWidget {
  final String category;

  const CategoryListingSection({
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
            color: const Color(0xFF007DFC),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
