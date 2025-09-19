import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class BottomNavigation extends StatelessWidget {
  final int selectedIndex;
  static const iconsData = [
    Iconsax.home,
    Iconsax.map,
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
        height: 60,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(24),
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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutBack,
        width: 36,
        height: 36,
        child: Icon(
          size: 30,
          iconData,
          color: isActive ? Colors.blue : Colors.grey[350],
        ),
      ),
    );
  }
}
