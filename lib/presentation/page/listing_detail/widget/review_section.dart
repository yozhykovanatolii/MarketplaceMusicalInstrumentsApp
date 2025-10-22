import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:marketplace_musical_instruments_app/data/model/review_model.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/review/review_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/review/review_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/add_review/add_review_page.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/listing_detail/widget/read_more_text.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/listing_detail/widget/user_avatar_and_full_name.dart';

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
    final listingReviewersAndRating = context.select(
      (ReviewBloc bloc) => bloc.state.reviewsAndRating,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ReviewAndRatingHeader(
            listingId: widget.listingId,
            rating:
                listingReviewersAndRating['ratingAndReviewerCount']?['averageRating'] ??
                0,
            reviewerCounter:
                listingReviewersAndRating['ratingAndReviewerCount']?['reviewerCount'] ??
                0,
          ),
          const SizedBox(height: 10),
          Row(
            spacing: 17,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _RatingSection(
                rating:
                    listingReviewersAndRating['ratingAndReviewerCount']?['averageRating'] ??
                    0,
                reviewerCounter:
                    listingReviewersAndRating['ratingAndReviewerCount']?['reviewerCount'] ??
                    0,
              ),
              Expanded(
                child: Column(
                  children: List.generate(
                    5,
                    (index) => _RatingSummaryProgressIndicator(
                      text: '${5 - index}',
                      value:
                          listingReviewersAndRating['ratingsProcent']?['${5 - index}'] ??
                          0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _ListingReviews(
            reviews: listingReviewersAndRating['reviews'] ?? [],
          ),
        ],
      ),
    );
  }
}

class _ReviewAndRatingHeader extends StatelessWidget {
  final String listingId;
  final double rating;
  final int reviewerCounter;

  const _ReviewAndRatingHeader({
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
          'Ratings & Reviews',
          style: TextStyle(
            fontSize: MediaQuery.textScalerOf(context).scale(18),
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              context: context,
              builder: (_) => AddReviewPage(
                listingId: listingId,
                rating: rating,
                reviewerCounter: reviewerCounter,
              ),
            );
          },
          child: Row(
            spacing: 5,
            children: [
              const Icon(
                Iconsax.edit_2,
                color: Color(0xFF007DFC),
              ),
              Text(
                'add review',
                style: TextStyle(
                  fontSize: MediaQuery.textScalerOf(context).scale(17),
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF007DFC),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _RatingSection extends StatelessWidget {
  final double rating;
  final int reviewerCounter;

  const _RatingSection({
    super.key,
    required this.rating,
    required this.reviewerCounter,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$rating',
          style: TextStyle(
            fontSize: MediaQuery.textScalerOf(context).scale(40),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '$reviewerCounter reviews',
          style: TextStyle(
            fontSize: MediaQuery.textScalerOf(context).scale(18),
            color: Colors.grey[600],
          ),
        ),
        RatingBarIndicator(
          rating: rating,
          itemSize: 30,
          itemBuilder: (BuildContext context, int index) {
            return const Icon(
              Icons.star,
              color: Colors.amber,
            );
          },
        ),
      ],
    );
  }
}

class _RatingSummaryProgressIndicator extends StatelessWidget {
  final String text;
  final double value;

  const _RatingSummaryProgressIndicator({
    super.key,
    required this.text,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: MediaQuery.textScalerOf(context).scale(18),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 5),
        const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: LinearProgressIndicator(
            value: value,
            minHeight: 10,
            backgroundColor: Colors.grey[300],
            color: const Color(0xFF007DFC),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ],
    );
  }
}

class _ListingReviews extends StatelessWidget {
  final List<ReviewModel> reviews;

  const _ListingReviews({
    super.key,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          return SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserAvatarAndFullName(
                  authorAvatar: reviews[index].viewerAvatar,
                  authorFullName: reviews[index].viewerFullName,
                ),
                const SizedBox(height: 10),
                Row(
                  spacing: 16,
                  children: [
                    RatingBarIndicator(
                      rating: reviews[index].rating.toDouble(),
                      itemSize: 20,
                      itemBuilder: (BuildContext context, int index) {
                        return const Icon(
                          Icons.star,
                          color: Colors.amber,
                        );
                      },
                    ),
                    Text(
                      '01.02.2026',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: MediaQuery.textScalerOf(context).scale(16),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ReadMoreText(
                  text: reviews[index].reviewText,
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 20),
      ),
    );
  }
}
