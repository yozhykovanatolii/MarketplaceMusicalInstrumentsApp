import 'package:marketplace_musical_instruments_app/domain/entity/review_summary_entity.dart';

abstract interface class ReviewRepository {
  Future<void> saveReview(
    int rating,
    String reviewText,
    double currentAverage,
    int reviewerCount,
    String listingId,
  );
  Stream<ReviewSummaryEntity> getListingRatingAndAllReviews(
    String listingId,
  );
}
