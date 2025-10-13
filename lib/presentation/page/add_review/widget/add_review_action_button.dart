import 'package:flutter/material.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_button.dart';

class AddReviewActionButton extends StatelessWidget {
  const AddReviewActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: AlignmentGeometry.bottomCenter,
        child: CommonButton(
          width: double.infinity,
          onPressed: () {
            Navigator.pop(context);
          },
          color: const Color(0xFF007DFC),
          child: const Text(
            'Add Review',
            style: TextStyle(
              fontSize: 17,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
