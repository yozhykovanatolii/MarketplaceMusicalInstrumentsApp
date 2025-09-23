import 'package:flutter/material.dart';

class DescriptionTextField extends StatelessWidget {
  final String? errorText;
  final String? counterText;
  final Function(String)? onChanged;

  const DescriptionTextField({
    super.key,
    this.errorText,
    this.counterText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: TextField(
        maxLines: null,
        minLines: 5,
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFFAFAFA),
          hintText: 'Enter description...',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 2.5,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding: const EdgeInsets.all(10),
          errorText: errorText,
          counterText: counterText,
        ),
      ),
    );
  }
}
