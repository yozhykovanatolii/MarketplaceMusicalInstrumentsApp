import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:marketplace_musical_instruments_app/domain/entity/review_entity.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/listing_detail/widget/read_more_text.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/listing_detail/widget/user_avatar_and_full_name.dart';

class ListingReviews extends StatelessWidget {
  final List<ReviewEntity> reviews;

  const ListingReviews({
    super.key,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        return SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserAvatarAndFullName(
                authorAvatar: reviews[index].authorAvatarUrl,
                authorFullName: reviews[index].authorFullName,
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
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ReadMoreText(
                text: reviews[index].text,
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 20),
    );
  }
}
