import 'package:flutter/material.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/home/widget/advertisement_banners.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/home/widget/filter_floating_action_button.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/home/widget/home_header.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/home/widget/text_search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeHeader(),
            SizedBox(height: 10),
            Row(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TextSearchBar(),
                ),
                FilterFloatingActionButton(),
              ],
            ),
            SizedBox(height: 20),
            AdvertisementBanners(),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
