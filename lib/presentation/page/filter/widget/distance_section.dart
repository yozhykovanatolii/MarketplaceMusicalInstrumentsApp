import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class DistanceSection extends StatelessWidget {
  const DistanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Distance',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 10,
          children: [
            _DistanceActionButton(
              onPressed: () {},
              isIncreasing: false,
            ),
            const _DistanceResultSection(),
            _DistanceActionButton(
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}

class _DistanceResultSection extends StatelessWidget {
  const _DistanceResultSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '2 km',
      style: TextStyle(
        fontSize: MediaQuery.textScalerOf(context).scale(18),
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class _DistanceActionButton extends StatelessWidget {
  final Function()? onPressed;
  final bool isIncreasing;

  const _DistanceActionButton({
    super.key,
    required this.onPressed,
    this.isIncreasing = true,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      onPressed: onPressed,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      child: Icon(
        isIncreasing ? Iconsax.add_copy : Iconsax.minus_copy,
      ),
    );
  }
}
