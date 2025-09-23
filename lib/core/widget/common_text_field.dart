import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController? controller;
  final IconData prefixIcon;
  final String hintText;
  final String? errorText;
  final String? counterText;
  final bool obscureText;
  final bool readOnly;
  final Function(String)? onChanged;
  final Function()? onTap;
  final TextInputType? keyboardType;

  const CommonTextField({
    super.key,
    required this.prefixIcon,
    required this.hintText,
    this.errorText,
    this.counterText,
    this.onChanged,
    this.controller,
    this.onTap,
    this.obscureText = false,
    this.readOnly = false,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      onTap: onTap,
      readOnly: readOnly,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFFAFAFA),
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
        prefixIcon: Icon(prefixIcon),
        hintText: hintText,
      ),
    );
  }
}
