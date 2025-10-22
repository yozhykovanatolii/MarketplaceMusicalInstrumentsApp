import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          child: const Icon(
            size: 30,
            Iconsax.notification_copy,
          ),
        ),
        Positioned(
          top: 2,
          right: 3,
          child: Container(
            width: 10,
            height: 10,
            decoration: const BoxDecoration(
              color: Color(0xFF007DFC),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
