import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class SectionListTile extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final Function()? onTap;

  const SectionListTile({
    super.key,
    required this.leadingIcon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        leadingIcon,
        size: 30,
        color: Colors.blue,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(
        Iconsax.arrow_right_3_copy,
        size: 30,
        color: Colors.blue,
      ),
    );
  }
}
