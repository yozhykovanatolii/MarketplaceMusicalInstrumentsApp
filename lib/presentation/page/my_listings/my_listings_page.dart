import 'package:flutter/material.dart';
import 'package:marketplace_musical_instruments_app/core/widget/listing_card.dart';

class MyListingsPage extends StatelessWidget {
  const MyListingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Listings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 0.65,
          crossAxisSpacing: 5,
          mainAxisSpacing: 10,
          children: [
            const ListingCard(),
            const ListingCard(),
            const ListingCard(),
            const ListingCard(),
          ],
        ),
      ),
    );
  }
}
