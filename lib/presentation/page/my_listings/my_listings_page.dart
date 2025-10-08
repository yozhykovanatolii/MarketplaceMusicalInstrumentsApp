import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/author_listing/author_listing_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/author_listing/author_listing_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/my_listings/widget/listings_section.dart';

class MyListingsPage extends StatefulWidget {
  const MyListingsPage({super.key});

  @override
  State<MyListingsPage> createState() => _MyListingsPageState();
}

class _MyListingsPageState extends State<MyListingsPage> {
  @override
  void initState() {
    context.read<AuthorListingBloc>().add(
      AuthorListingsFetchEvent(),
    );
    super.initState();
  }

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
              Placeholder(),
            ],
          ),
        ),
      ),
    );
  }
}
