import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class GetUserLocationButton extends StatelessWidget {
  final Function()? onPressed;

  const GetUserLocationButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      heroTag: 'GetUserLocation',
      backgroundColor: Colors.white,
      foregroundColor: Colors.blue,
      shape: const CircleBorder(),
      child: const Icon(
        Iconsax.gps,
      ),
    );
  }
}
