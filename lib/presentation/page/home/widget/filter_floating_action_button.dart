import 'package:flutter/material.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/filter/filter_page.dart';

class FilterFloatingActionButton extends StatelessWidget {
  const FilterFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const FilterPage()),
          );
        },
        child: const Icon(Icons.tune),
      ),
    );
  }
}
