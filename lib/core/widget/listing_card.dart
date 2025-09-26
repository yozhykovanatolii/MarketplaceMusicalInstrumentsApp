import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ListingCard extends StatelessWidget {
  const ListingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 7,
      child: Column(
        spacing: 5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _PhotoSectionCard(),
          _ShortDescriptionSection(),
        ],
      ),
    );
  }
}

class _PhotoSectionCard extends StatelessWidget {
  const _PhotoSectionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 170,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadiusDirectional.circular(15),
            child: Image.asset(
              'assets/images/test.jpg',
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          right: 3,
          child: IconButton.filled(
            onPressed: () {},
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
  const _ShortDescriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 5,
        children: [
          const Text(
            'Mouse Logitech M102',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          RichText(
            text: const TextSpan(
              text: '\$25.00',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
              children: [
                TextSpan(
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
