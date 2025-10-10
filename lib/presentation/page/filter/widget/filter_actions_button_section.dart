import 'package:flutter/material.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_button.dart';

class FilterActionsButtonSection extends StatelessWidget {
  const FilterActionsButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: AlignmentGeometry.bottomCenter,
        child: Row(
          spacing: 20,
          children: [
            Flexible(
              child: _FilterActionButton(
                text: 'Reset Filter',
                onPressed: () {},
                isResetButton: true,
              ),
            ),
            Flexible(
              child: _FilterActionButton(
                text: 'Apply',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterActionButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final bool isResetButton;

  const _FilterActionButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isResetButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return CommonButton(
      width: MediaQuery.of(context).size.width / 2,
      onPressed: onPressed,
      color: isResetButton ? Colors.grey[300]! : const Color(0xFF007DFC),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 17,
          color: isResetButton ? const Color(0xFF007DFC) : Colors.white,
        ),
      ),
    );
  }
}
