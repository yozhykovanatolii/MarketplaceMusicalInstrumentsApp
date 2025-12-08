import 'package:flutter/material.dart';
import 'package:marketplace_musical_instruments_app/core/helper/ui_helper.dart';
import 'package:marketplace_musical_instruments_app/core/theme/app_colors.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/filter/filter_page.dart';

class FilterFloatingActionButton extends StatelessWidget {
  const FilterFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: FloatingActionButton(
        backgroundColor: const Color(AppColors.kBlue),
        foregroundColor: Colors.white,
        onPressed: () => UiHelper.showModalSheet(
          context,
          const FilterPage(),
        ),
        child: const Icon(Icons.tune),
      ),
    );
  }
}
