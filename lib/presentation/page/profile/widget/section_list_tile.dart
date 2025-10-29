import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class SectionListTile extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final Function()? onTap;
  final bool isLogOut;

  const SectionListTile({
    super.key,
    required this.leadingIcon,
    required this.title,
    this.isLogOut = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        leadingIcon,
        size: 30,
        color: isLogOut ? Colors.red : const Color(0xFF007DFC),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isLogOut ? Colors.red : null,
        ),
      ),
      trailing: const Icon(
        Iconsax.arrow_right_3_copy,
        size: 30,
        color: Color(0xFF007DFC),
      ),
    );
  }
}
