import 'package:flutter/material.dart';
import 'package:marketplace_musical_instruments_app/core/widget/get_user_location_button.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/home/widget/filter_floating_action_button.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/home/widget/google_map_section.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/home/widget/text_search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: Stack(
          children: [
            GoogleMapSection(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
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
      floatingActionButton: GetUserLocationButton(
        onPressed: () {},
      ),
    );
  }
}
