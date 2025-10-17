import 'package:flutter/material.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_button.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 5,
      child: Align(
        alignment: AlignmentGeometry.bottomCenter,
        child: CommonButton(
          width: MediaQuery.of(context).size.width,
          onPressed: () {},
          color: const Color(0xFF007DFC),
          child: Text(
            'Save',
            style: TextStyle(
              fontSize: MediaQuery.textScalerOf(context).scale(18),
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
