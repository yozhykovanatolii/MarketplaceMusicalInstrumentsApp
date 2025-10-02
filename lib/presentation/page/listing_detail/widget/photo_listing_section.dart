import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:marketplace_musical_instruments_app/core/widget/favourite_button.dart';

class PhotoListingSection extends StatelessWidget {
  final List<String> photos;

  const PhotoListingSection({
    super.key,
    required this.photos,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: photos.length,
        itemBuilder: (_, index) {
          return _ImageItem(
            photoUrl: photos[index],
            currentPhotoIndex: index + 1,
            photoCount: photos.length,
          );
        },
      ),
    );
  }
}

class _ImageItem extends StatelessWidget {
  final String photoUrl;
  final int currentPhotoIndex;
  final int photoCount;

  const _ImageItem({
    super.key,
    required this.photoUrl,
    required this.currentPhotoIndex,
    required this.photoCount,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          photoUrl,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),
        const Positioned(
          top: 10,
          right: 8,
          child: FavouriteButton(),
        ),
        Positioned(
          top: 10,
          left: 8,
          child: IconButton.filled(
            onPressed: () {},
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.white),
            ),
            icon: const Icon(
              Iconsax.arrow_left_copy,
              color: Colors.black,
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 8,
          child: _PhotoCounterSection(
            currentPhotoIndex: currentPhotoIndex,
            photoCount: photoCount,
          ),
        ),
      ],
    );
  }
}

class _PhotoCounterSection extends StatelessWidget {
  final int currentPhotoIndex;
  final int photoCount;

  const _PhotoCounterSection({
    super.key,
    required this.currentPhotoIndex,
    required this.photoCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 35,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          '$currentPhotoIndex/$photoCount',
          style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.textScalerOf(context).scale(18),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
