import 'package:flutter/material.dart';

class CommonDescriptionTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final String? errorText;
  final String? counterText;
  final Function(String)? onChanged;

  const CommonDescriptionTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.errorText,
    this.counterText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: TextField(
        controller: controller,
        maxLines: null,
        minLines: 5,
        onChanged: onChanged,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFF6F6F6),
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
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 18,
          ),
          contentPadding: const EdgeInsets.all(10),
          errorText: errorText,
          counterText: counterText,
        ),
      ),
    );
  }
}
