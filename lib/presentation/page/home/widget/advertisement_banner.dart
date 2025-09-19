import 'package:flutter/material.dart';

class AdvertisementBanner extends StatelessWidget {
  const AdvertisementBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 170,
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(15),
        child: const Image(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/banner1.png'),
        ),
      ),
    );
  }
}
