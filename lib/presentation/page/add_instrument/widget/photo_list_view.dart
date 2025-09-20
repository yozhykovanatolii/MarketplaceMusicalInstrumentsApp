import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class PhotoListView extends StatelessWidget {
  static const photosLength = 4;
  const PhotoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: photosLength + 1,
      itemBuilder: (context, index) {
        if (index < photosLength) {
          return const _PhotoCardItem(
            photoPath: 'assets/images/test.jpg',
          );
        }
        return const _OpenGalleryButton();
      },
      separatorBuilder: (_, __) => const SizedBox(width: 10),
    );
  }
}

class _PhotoCardItem extends StatelessWidget {
  final String photoPath;

  const _PhotoCardItem({
    super.key,
    required this.photoPath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 120,
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(12),
            child: Image.asset(
              fit: BoxFit.cover,
              photoPath,
            ),
          ),
        ),
        Positioned(
          left: 75,
          child: IconButton(
            iconSize: 30,
            onPressed: () {},
            style: const ButtonStyle(
              foregroundColor: WidgetStatePropertyAll(Colors.white),
            ),
            icon: const Icon(
              Iconsax.close_circle,
            ),
          ),
        ),
      ],
    );
  }
}

class _OpenGalleryButton extends StatelessWidget {
  const _OpenGalleryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: const SizedBox(
        width: 50,
        child: Icon(
          size: 30,
          Iconsax.add_circle,
        ),
      ),
    );
  }
}
