import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_progress_indicator.dart';
import 'package:marketplace_musical_instruments_app/core/widget/listing_card.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/favourite_listings/favourite_listings_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/favourite_listings/favourite_listings_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/favourite_listings/favourite_listings_state.dart';

class FavouriteListingsPage extends StatefulWidget {
  const FavouriteListingsPage({super.key});

  @override
  State<FavouriteListingsPage> createState() => _FavouriteListingsPageState();
}

class _FavouriteListingsPageState extends State<FavouriteListingsPage> {
  @override
  void initState() {
    context.read<FavouriteListingsBloc>().add(
      FavouriteListingsFetchEvent(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favourite',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: BlocBuilder<FavouriteListingsBloc, FavouriteListingsState>(
          builder: (context, state) {
            final status = state.status;
            if (status == FavouriteListingsStatus.failure) {
              return Center(
                child: Text(
                  state.errorMessage,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }
            if (status == FavouriteListingsStatus.success) {
              final favouriteListings = state.favouriteListings;
              return GridView.builder(
                itemCount: favouriteListings.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250,
                  childAspectRatio: 0.615,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemBuilder: (_, index) {
                  return ListingCard(
                    listing: favouriteListings[index],
                    isEditing: false,
                  );
                },
              );
            }
            return const Center(
              child: CommonProgressIndicator(
                scale: 1.08,
                color: Colors.blue,
              ),
            );
          },
        ),
      ),
    );
  }
}
