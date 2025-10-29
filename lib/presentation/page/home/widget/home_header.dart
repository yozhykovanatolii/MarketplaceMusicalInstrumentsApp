import 'package:flutter/material.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/home/widget/notification_button.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Rentify',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const NotificationButton(),
      ],
    );
  }
}
