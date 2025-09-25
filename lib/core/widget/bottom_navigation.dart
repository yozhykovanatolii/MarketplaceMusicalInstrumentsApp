import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class BottomNavigation extends StatelessWidget {
  final int selectedIndex;
  static const iconsData = [
    Iconsax.home,
    Iconsax.map,
    Iconsax.add,
    Iconsax.heart,
    Iconsax.user,
  ];
  final ValueChanged<int> onTap;

  const BottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 56,
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(iconsData.length, (int index) {
            return _BottomNavigationItem(
              iconData: iconsData[index],
              isActive: selectedIndex == index,
              onTap: () => onTap(index),
            );
          }),
        ),
      ),
    );
  }
}

class _BottomNavigationItem extends StatelessWidget {
  final IconData iconData;
  final bool isActive;
  final GestureTapCallback onTap;

  const _BottomNavigationItem({
    super.key,
    required this.iconData,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: 3,
            width: isActive ? 24 : 0,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOutBack,
            width: 36,
            height: 36,
            child: Icon(
              size: 24,
              iconData,
              color: isActive ? Colors.blue : Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }
}
