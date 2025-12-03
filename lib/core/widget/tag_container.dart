import 'package:flutter/material.dart';

class TagContainer extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? colorContainer;
  final Color colorText;
  final FontWeight? fontWeight;

  const TagContainer({
    super.key,
    required this.text,
    required this.fontSize,
    required this.colorContainer,
    required this.fontWeight,
    required this.colorText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: colorContainer,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: colorText,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
