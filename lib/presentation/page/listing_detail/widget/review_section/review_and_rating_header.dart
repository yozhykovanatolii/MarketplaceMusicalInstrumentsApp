import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:marketplace_musical_instruments_app/core/helper/ui_helper.dart';
import 'package:marketplace_musical_instruments_app/core/theme/app_colors.dart';
import 'package:marketplace_musical_instruments_app/generated/l10n.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/add_review/add_review_page.dart';

class ReviewAndRatingHeader extends StatelessWidget {
  final String listingId;
  final double rating;
  final int reviewerCounter;

  const ReviewAndRatingHeader({
    super.key,
    required this.listingId,
    required this.rating,
    required this.reviewerCounter,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).ratingsReviews,
          style: TextStyle(
            fontSize: MediaQuery.textScalerOf(context).scale(18),
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: () => UiHelper.showModalSheet(
            context,
            AddReviewPage(
              listingId: listingId,
              rating: rating,
              reviewerCounter: reviewerCounter,
            ),
          ),
          child: Row(
            spacing: 5,
            children: [
              const Icon(
                Iconsax.edit_2,
                color: Color(AppColors.kBlue),
              ),
              Text(
                S.of(context).addReview,
                style: TextStyle(
                  fontSize: MediaQuery.textScalerOf(context).scale(17),
                  fontWeight: FontWeight.w500,
                  color: const Color(AppColors.kBlue),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
