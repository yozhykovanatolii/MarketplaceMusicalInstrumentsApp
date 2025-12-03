import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:marketplace_musical_instruments_app/core/widget/dashed_border.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/save_listing/save_listing_cubit.dart';

class PhotoListView extends StatelessWidget {
  const PhotoListView({super.key});

  @override
  Widget build(BuildContext context) {
    final listingPhotos = context.select(
      (SaveListingCubit bloc) => bloc.state.photos,
    );
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: listingPhotos.length + 1,
        itemBuilder: (context, index) {
          if (index < listingPhotos.length) {
            return _PhotoCardItem(
              photoUrl: listingPhotos[index],
            );
          }
          return const _OpenGalleryButton();
        },
        separatorBuilder: (_, __) => const SizedBox(width: 10),
      ),
    );
  }
}

class _PhotoCardItem extends StatelessWidget {
  final String photoUrl;

  const _PhotoCardItem({
    required this.photoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 120,
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(12),
            child: Image.network(
              fit: BoxFit.cover,
              photoUrl,
            ),
          ),
        ),
        Positioned(
          left: 75,
          child: IconButton(
            iconSize: 30,
            onPressed: () => context
                .read<SaveListingCubit>()
                .onDeleteListingPhotoFromList(photoUrl),
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
  const _OpenGalleryButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<SaveListingCubit>().onAddListingPhotoInList(),
      child: CustomPaint(
        painter: DashedBorder(),
        child: Container(
          width: 120,
          alignment: Alignment.center,
          child: const Icon(
            size: 30,
            Iconsax.add_circle,
          ),
        ),
      ),
    );
  }
}
