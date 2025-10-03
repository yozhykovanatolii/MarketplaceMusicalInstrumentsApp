import 'package:flutter/material.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_button.dart';

class PriceListingSection extends StatelessWidget {
  const PriceListingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: Colors.black,
            width: 0.4,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price',
                  style: TextStyle(
                    fontSize: MediaQuery.textScalerOf(context).scale(18),
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: '\$30',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: MediaQuery.textScalerOf(context).scale(23),
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: '/hr',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                          fontSize: MediaQuery.textScalerOf(context).scale(18),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            CommonButton(
              onPressed: () {},
              width: MediaQuery.of(context).size.width / 2,
              child: const Text(
                'Book Now',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
