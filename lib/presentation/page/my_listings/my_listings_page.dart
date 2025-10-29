import 'package:flutter/material.dart';
import 'package:marketplace_musical_instruments_app/generated/l10n.dart';
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
          title: Text(S.of(context).myListings),
          bottom: TabBar(
            tabs: [
              Tab(text: S.of(context).listings),
              Tab(text: S.of(context).requests),
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
