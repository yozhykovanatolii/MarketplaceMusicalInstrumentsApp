import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:marketplace_musical_instruments_app/core/widget/delete_dialog_box.dart';
import 'package:marketplace_musical_instruments_app/data/model/listing_model.dart';

class ListingCard extends StatelessWidget {
  final ListingModel listing;

  const ListingCard({
    super.key,
    required this.listing,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      child: Column(
        spacing: 5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _PhotoSectionCard(
            imageUrl: listing.photos.first,
            listingId: listing.id,
          ),
          _ShortDescriptionSection(
            title: listing.title,
            price: listing.priceByHour,
          ),
        ],
      ),
    );
  }
}

class _PhotoSectionCard extends StatelessWidget {
  final String imageUrl;
  final String listingId;

  const _PhotoSectionCard({
    super.key,
    required this.imageUrl,
    required this.listingId,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 170,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadiusDirectional.circular(15),
            child: Image.network(
              imageUrl,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          right: 3,
          child: IconButton.filled(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => DeleteDialogBox(
                  listingId: listingId,
                ),
              );
            },
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.white),
            ),
            icon: const Icon(
              Iconsax.trash,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}

class _ShortDescriptionSection extends StatelessWidget {
  final String title;
  final int price;

  const _ShortDescriptionSection({
    super.key,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 5,
        children: [
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          RichText(
            text: TextSpan(
              text: '\$$price',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
              children: [
                const TextSpan(
                  text: '/hr',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const _AverageRatingSection(),
        ],
      ),
    );
  }
}

class _AverageRatingSection extends StatelessWidget {
  const _AverageRatingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      spacing: 2,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Icon(
          Icons.star,
          size: 27,
          color: Colors.amber,
        ),
        Text(
          '4.9',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
