import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/add_and_edit_listing/add_and_edit_listing_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/add_and_edit_listing/add_and_edit_listing_event.dart';

class PhotoListView extends StatelessWidget {
  static const photosLength = 4;
  const PhotoListView({super.key});

  @override
  Widget build(BuildContext context) {
    final listingPhotos = context.select(
      (AddAndEditListingBloc bloc) => bloc.state.photos,
    );
    return ListView.separated(
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
    );
  }
}

class _PhotoCardItem extends StatelessWidget {
  final String photoUrl;

  const _PhotoCardItem({
    super.key,
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
            onPressed: () => context.read<AddAndEditListingBloc>().add(
              DeleteListingPhotoEvent(photoUrl),
            ),
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
      onTap: () => context.read<AddAndEditListingBloc>().add(
        AddListingPhotoEvent(),
      ),
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
