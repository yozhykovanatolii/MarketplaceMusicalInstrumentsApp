import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_progress_indicator.dart';
import 'package:marketplace_musical_instruments_app/core/widget/listing_card.dart';
import 'package:marketplace_musical_instruments_app/generated/l10n.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/listing/listing_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/listing/listing_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/home/widget/advertisement_banner.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/home/widget/filter_floating_action_button.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/home/widget/home_header.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/home/widget/text_search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeHeader(),
            const SizedBox(height: 10),
            const Row(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TextSearchBar(),
                ),
                FilterFloatingActionButton(),
              ],
            ),
            const SizedBox(height: 20),
            const AdvertisementBanner(),
            const SizedBox(height: 20),
            Text(
              S.of(context).recommendedForYou,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<ListingBloc, ListingState>(
                builder: (context, state) {
                  if (state.status == ListingStatus.failure) {
                    return Center(
                      child: Text(
                        state.errorMessage,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    );
                  }
                  if (state.status == ListingStatus.success) {
                    final listings = state.listings;
                    return GridView.builder(
                      itemCount: listings.length,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 250,
                            childAspectRatio: 0.615,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                          ),
                      itemBuilder: (_, index) {
                        return ListingCard(
                          listing: listings[index],
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
          ],
        ),
      ),
    );
  }
}
