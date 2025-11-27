import 'package:marketplace_musical_instruments_app/domain/entity/rating_procent_entity.dart';
import 'package:marketplace_musical_instruments_app/domain/entity/review_entity.dart';

class ReviewSummaryEntity {
  final double averageRating;
  final int reviewerCount;
  final List<ReviewEntity> reviews;
  final List<RatingProcentEntity> ratingProcents;

  ReviewSummaryEntity({
    required this.averageRating,
    required this.reviewerCount,
    required this.reviews,
    required this.ratingProcents,
  });

  factory ReviewSummaryEntity.initial() {
    return ReviewSummaryEntity(
      averageRating: 0,
      reviewerCount: 0,
      reviews: [],
      ratingProcents: [],
    );
  }
}
