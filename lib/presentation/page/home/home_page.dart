import 'package:flutter/material.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/home/widget/filter_floating_action_button.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/home/widget/google_map_section.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/home/widget/text_search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMapSection(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Row(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextSearchBar(),
                  ),
                  FilterFloatingActionButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
