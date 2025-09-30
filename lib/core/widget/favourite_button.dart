import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class FavouriteButton extends StatelessWidget {
  const FavouriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: () {},
      style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.white),
      ),
      icon: const Icon(
        Iconsax.heart_copy,
        color: Colors.black,
      ),
    );
  }
}
