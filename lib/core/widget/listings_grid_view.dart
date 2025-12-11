import 'package:flutter/material.dart';
import 'package:marketplace_musical_instruments_app/core/widget/listing_card.dart';
import 'package:marketplace_musical_instruments_app/domain/entity/listing_entity.dart';

class ListingsGridView extends StatelessWidget {
  final ScrollController? controller;
  final bool isEditingListings;
  final List<ListingEntity> listings;

  const ListingsGridView({
    super.key,
    required this.listings,
    this.isEditingListings = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: controller,
      itemCount: listings.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250,
        childAspectRatio: 0.615,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemBuilder: (_, index) {
        return ListingCard(
          listing: listings[index],
          isEditing: isEditingListings,
        );
      },
    );
  }
}
