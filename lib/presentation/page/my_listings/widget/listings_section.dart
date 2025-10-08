import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_progress_indicator.dart';
import 'package:marketplace_musical_instruments_app/core/widget/listing_card.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/author_listing/author_listing_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/author_listing/author_listing_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/author_listing/author_listing_state.dart';

class ListingsSection extends StatefulWidget {
  const ListingsSection({super.key});

  @override
  State<ListingsSection> createState() => _ListingsSectionState();
}

class _ListingsSectionState extends State<ListingsSection> {
  @override
  void initState() {
    context.read<AuthorListingBloc>().add(
      AuthorListingsFetchEvent(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthorListingBloc, AuthorListingState>(
      builder: (context, state) {
        if (state is AuthorListingFailureState) {
          return Center(
            child: Text(state.errorMessage),
          );
        }
        if (state is AuthorListingSuccessState) {
          final authorListings = state.authorListings;
          return GridView.builder(
            itemCount: authorListings.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250,
              childAspectRatio: 0.615,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            itemBuilder: (_, index) {
              return ListingCard(
                listing: authorListings[index],
              );
            },
          );
        }
        return const Center(
          child: CommonProgressIndicator(
            scale: 1.2,
            color: Colors.blue,
          ),
        );
      },
    );
  }
}
