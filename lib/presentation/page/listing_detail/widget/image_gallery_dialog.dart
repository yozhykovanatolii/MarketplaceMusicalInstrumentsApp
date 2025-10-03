import 'package:flutter/material.dart';

class ImageGalleryDialog extends StatelessWidget {
  final List<String> photos;
  final int currentPhotoIndex;

  const ImageGalleryDialog({
    super.key,
    required this.photos,
    required this.currentPhotoIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: PageView.builder(
          itemCount: photos.length,
          controller: PageController(initialPage: currentPhotoIndex),
          itemBuilder: (context, index) {
            return InteractiveViewer(
              maxScale: 5,
              minScale: 0.5,
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(15),
                child: Image.network(
                  photos[index],
                  fit: BoxFit.fill,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
