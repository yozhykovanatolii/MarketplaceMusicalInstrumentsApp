import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_progress_indicator.dart';
import 'package:marketplace_musical_instruments_app/core/widget/listings_grid_view.dart';
import 'package:marketplace_musical_instruments_app/core/localization/generated/l10n.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/listing/listing_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/listing/state/listing_state.dart';

class ListingsDrawableSheet extends StatelessWidget {
  const ListingsDrawableSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.2,
      minChildSize: 0.2,
      maxChildSize: 0.8,
      snap: true,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          padding: const EdgeInsetsGeometry.only(
            top: 10,
            left: 10,
            right: 10,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),
          child: Column(
            spacing: 20,
            children: [
              Container(
                height: 3,
                width: 45,
                color: Colors.grey,
              ),
              Text(
                S.of(context).listOfListings,
                style: Theme.of(context).textTheme.labelLarge,
              ),
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
                      return ListingsGridView(
                        listings: listings,
                        controller: scrollController,
                        isEditingListings: false,
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
        );
      },
    );
  }
}
