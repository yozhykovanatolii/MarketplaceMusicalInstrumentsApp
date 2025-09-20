import 'package:flutter/material.dart';

class PhotoListView extends StatelessWidget {
  const PhotoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 4,
      itemBuilder: (context, index) {
        return const _PhotoCardItem();
      },
    );
  }
}

class _PhotoCardItem extends StatelessWidget {
  const _PhotoCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
