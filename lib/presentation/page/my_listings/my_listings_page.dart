import 'package:flutter/material.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/my_listings/widget/listings_section.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/my_listings/widget/requests_section.dart';

class MyListingsPage extends StatelessWidget {
  const MyListingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'My Listings',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.blue,
            labelColor: Colors.blue,
            indicatorWeight: 4,
            labelStyle: TextStyle(
              fontSize: MediaQuery.textScalerOf(context).scale(17),
              fontWeight: FontWeight.w500,
            ),
            tabs: const [
              Tab(text: 'Listings'),
              Tab(text: 'Requests'),
            ],
          ),
        ),
        body: const SafeArea(
          minimum: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: TabBarView(
            children: [
              ListingsSection(),
              RequestsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
