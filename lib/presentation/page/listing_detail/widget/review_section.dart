import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/listing_detail/widget/read_more_text.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/listing_detail/widget/user_avatar_and_full_name.dart';

class ReviewSection extends StatelessWidget {
  const ReviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ReviewAndRatingHeader(),
          SizedBox(height: 10),
          Row(
            spacing: 17,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _RatingSection(),
              Expanded(
                child: Column(
                  children: [
                    _RatingSummaryProgressIndicator(
                      text: '5',
                      value: 1,
                    ),
                    _RatingSummaryProgressIndicator(
                      text: '4',
                      value: 0.8,
                    ),
                    _RatingSummaryProgressIndicator(
                      text: '3',
                      value: 0.6,
                    ),
                    _RatingSummaryProgressIndicator(
                      text: '2',
                      value: 0.4,
                    ),
                    _RatingSummaryProgressIndicator(
                      text: '1',
                      value: 0.2,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          _ListingReviews(),
        ],
      ),
    );
  }
}

class _ReviewAndRatingHeader extends StatelessWidget {
  const _ReviewAndRatingHeader({super.key});

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
          onTap: () => print('Default message.'),
          child: Row(
            spacing: 5,
            children: [
              const Icon(
                Iconsax.edit_2,
                color: Colors.blue,
              ),
              Text(
                'add review',
                style: TextStyle(
                  fontSize: MediaQuery.textScalerOf(context).scale(17),
                  fontWeight: FontWeight.w500,
                  color: Colors.blue,
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
  const _RatingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '4.9',
          style: TextStyle(
            fontSize: MediaQuery.textScalerOf(context).scale(40),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '2152 reviews',
          style: TextStyle(
            fontSize: MediaQuery.textScalerOf(context).scale(18),
            color: Colors.grey[600],
          ),
        ),
        RatingBarIndicator(
          rating: 4.9,
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
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ],
    );
  }
}

class _ListingReviews extends StatelessWidget {
  static const reviewsText = [
    'This electric keyboard is perfect for beginners or adults who’ve never played before but want to give it a try without spending a lot. It’s easy to use, has all the basic features you need to start learning, and feels surprisingly good for the price. A great choice for anyone testing the waters before investing in a more expensive model.',
    'I played piano a little as a kid and have been wanting to get back into it. A year ago when I purchased this, I wasn\'t sure how serious I\'d be about practicing.',
    'My son loves this piano set! It comes with a stool, the actual piano, a stand, and earphones to plug in',
  ];
  const _ListingReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: reviewsText.length,
        itemBuilder: (context, index) {
          return SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const UserAvatarAndFullName(),
                const SizedBox(height: 10),
                Row(
                  spacing: 16,
                  children: [
                    RatingBarIndicator(
                      rating: 4.9,
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
                  text: reviewsText[index],
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
