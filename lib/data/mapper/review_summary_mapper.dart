import 'package:marketplace_musical_instruments_app/domain/entity/rating_procent_entity.dart';
import 'package:marketplace_musical_instruments_app/domain/entity/review_entity.dart';
import 'package:marketplace_musical_instruments_app/domain/entity/review_summary_entity.dart';

class ReviewSummaryMapper {
  static ReviewSummaryEntity toEntity(
    Map<String, dynamic> ratingAndReviewerCount,
    List<ReviewEntity> reviews,
    List<RatingProcentEntity> ratingProcents,
  ) {
    return ReviewSummaryEntity(
      averageRating: ratingAndReviewerCount['averageRating'] ?? 0,
      reviewerCount: ratingAndReviewerCount['reviewerCount'] ?? 0,
      reviews: reviews,
      ratingProcents: ratingProcents,
    );
  }
}
