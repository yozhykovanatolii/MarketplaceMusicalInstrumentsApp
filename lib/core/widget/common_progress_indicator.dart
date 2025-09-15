import 'package:flutter/material.dart';

class CommonProgressIndicator extends StatelessWidget {
  final double? scale;

  const CommonProgressIndicator({
    super.key,
    this.scale,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: const CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  }
}
