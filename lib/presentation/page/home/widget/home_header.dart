import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Icon(
          size: 60,
          Icons.store,
        ),
        Text(
          'Rentify',
          style: TextStyle(
            fontFamily: 'Times New Roman',
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
