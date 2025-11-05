import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:marketplace_musical_instruments_app/generated/l10n.dart';

class BottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const BottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final iconsData = [
      _MenuItem(text: S.of(context).home, iconData: Iconsax.home),
      _MenuItem(text: S.of(context).favourite, iconData: Iconsax.heart),
      _MenuItem(text: S.of(context).create, iconData: Iconsax.add),
      _MenuItem(text: S.of(context).profile, iconData: Iconsax.user),
    ];
    return SafeArea(
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(iconsData.length, (int index) {
            return _BottomNavigationItem(
              menuItem: iconsData[index],
              isActive: selectedIndex == index,
              onTap: () => onTap(index),
            );
          }),
        ),
      ),
    );
  }
}

class _MenuItem {
  final String text;
  final IconData iconData;

  _MenuItem({
    required this.text,
    required this.iconData,
  });
}

class _BottomNavigationItem extends StatelessWidget {
  final _MenuItem menuItem;
  final bool isActive;
  final GestureTapCallback onTap;

  const _BottomNavigationItem({
    super.key,
    required this.menuItem,
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
          const SizedBox(height: 4),
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: 3,
            width: isActive ? 24 : 0,
            decoration: BoxDecoration(
              color: const Color(0xFF007DFC),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOutBack,
            width: 36,
            height: 28,
            child: Icon(
              size: 23,
              menuItem.iconData,
              color: isActive ? const Color(0xFF007DFC) : Colors.grey[400],
            ),
          ),
          Text(
            menuItem.text,
            style: TextStyle(
              fontSize: 13,
              color: isActive ? const Color(0xFF007DFC) : Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }
}
