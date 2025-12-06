import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/review/review_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/review/review_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/listing_detail/widget/review_section/listing_reviews.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/listing_detail/widget/review_section/rating_section.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/listing_detail/widget/review_section/rating_summary_indicator.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/listing_detail/widget/review_section/review_and_rating_header.dart';

class ReviewSection extends StatefulWidget {
  final String listingId;

  const ReviewSection({
    super.key,
    required this.listingId,
  });

  @override
  State<ReviewSection> createState() => _ReviewSectionState();
}

class _ReviewSectionState extends State<ReviewSection> {
  @override
  void initState() {
    context.read<ReviewBloc>().add(ReviewAndRatingFetchEvent(widget.listingId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final reviewSummaryEntity = context.select(
      (ReviewBloc bloc) => bloc.state.reviewSummaryEntity,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReviewAndRatingHeader(
            listingId: widget.listingId,
            rating: reviewSummaryEntity.averageRating,
            reviewerCounter: reviewSummaryEntity.reviewerCount,
          ),
          const SizedBox(height: 10),
          Row(
            spacing: 17,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RatingSection(
                rating: reviewSummaryEntity.averageRating,
                reviewerCounter: reviewSummaryEntity.reviewerCount,
              ),
              Expanded(
                child: Column(
                  children: List.generate(
                    reviewSummaryEntity.ratingProcents.length,
                    (index) => RatingSummaryIndicator(
                      text: reviewSummaryEntity.ratingProcents[index].star,
                      value: reviewSummaryEntity.ratingProcents[index].procent,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListingReviews(
              reviews: reviewSummaryEntity.reviews,
            ),
          ),
        ],
      ),
    );
  }
}
