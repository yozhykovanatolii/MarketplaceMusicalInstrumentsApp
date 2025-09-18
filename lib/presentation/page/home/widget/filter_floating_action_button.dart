import 'package:flutter/material.dart';

class FilterFloatingActionButton extends StatelessWidget {
  const FilterFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {},
        child: const Icon(Icons.tune),
      ),
    );
  }
}
