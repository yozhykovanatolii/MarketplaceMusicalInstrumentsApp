import 'package:flutter/material.dart';

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
          (index) => _CategoryFilterChip(label: categories[index]),
        ),
      ),
    );
  }
}

class _CategoryFilterChip extends StatefulWidget {
  final String label;

  const _CategoryFilterChip({
    super.key,
    required this.label,
  });

  @override
  State<_CategoryFilterChip> createState() => _CategoryFilterChipState();
}

class _CategoryFilterChipState extends State<_CategoryFilterChip> {
  bool _isSelected = false;

  void _selectChip() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _selectChip,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        margin: const EdgeInsets.symmetric(horizontal: 3),
        decoration: BoxDecoration(
          color: _isSelected ? const Color(0xFF007DFC) : Colors.grey[200],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            widget.label,
            style: TextStyle(
              fontSize: MediaQuery.textScalerOf(context).scale(17),
              color: _isSelected ? Colors.white : Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
