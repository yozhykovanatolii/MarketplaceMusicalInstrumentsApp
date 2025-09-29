import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:marketplace_musical_instruments_app/core/widget/delete_dialog_box.dart';
import 'package:marketplace_musical_instruments_app/data/model/listing_model.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/add_instrument/add_and_edit_instrument_page.dart';

class ListingCard extends StatelessWidget {
  final ListingModel listing;
  final bool isEditing;

  const ListingCard({
    super.key,
    required this.listing,
    this.isEditing = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isEditing) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddAndEditInstrumentPage(
                listing: listing,
              ),
            ),
          );
        }
      },
      child: Card(
        elevation: 7,
        child: Column(
          spacing: 5,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _PhotoSectionCard(
              imageUrl: listing.photos.first,
              listingId: listing.id,
            ),
            Flexible(
              child: _ShortDescriptionSection(
                title: listing.title,
                price: listing.priceByHour,
              ),
            ),
          ],
        ),
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
        AspectRatio(
          aspectRatio: 1.12,
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
        spacing: 2,
        children: [
          Text(
            'Prepared Hero Emergency Fire Blanket 303',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: MediaQuery.textScalerOf(context).scale(15),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '\$$price',
            style: TextStyle(
              fontSize: MediaQuery.textScalerOf(context).scale(23),
              fontWeight: FontWeight.bold,
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
    return Row(
      children: [
        const Icon(
          Icons.star,
          size: 27,
          color: Colors.amber,
        ),
        RichText(
          text: TextSpan(
            text: '4.9 ',
            style: TextStyle(
              fontSize: MediaQuery.textScalerOf(context).scale(17),
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            children: [
              const TextSpan(
                text: '(2152)',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
