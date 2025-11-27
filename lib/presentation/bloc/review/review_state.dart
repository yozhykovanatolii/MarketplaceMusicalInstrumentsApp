import 'package:marketplace_musical_instruments_app/core/validator/review_validator.dart';
import 'package:marketplace_musical_instruments_app/domain/entity/review_summary_entity.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/save_listing/save_listing_state.dart';

class ReviewState {
  final ReviewSummaryEntity reviewSummaryEntity;
  final double rating;
  final String reviewText;

  ReviewState({
    required this.reviewSummaryEntity,
    required this.rating,
    required this.reviewText,
  });

  factory ReviewState.initial() {
    return ReviewState(
      reviewSummaryEntity: ReviewSummaryEntity.initial(),
      rating: 0,
      reviewText: '',
    );
  }

  ReviewState copyWith({
    ReviewSummaryEntity? reviewSummaryEntity,
    double? rating,
    String? reviewText,
  }) {
    return ReviewState(
      reviewSummaryEntity: reviewSummaryEntity ?? this.reviewSummaryEntity,
      rating: rating ?? this.rating,
      reviewText: reviewText ?? this.reviewText,
    );
  }

  String get counterReviewText => '${reviewText.length}/445';

  String? get reviewTextError => ReviewValidator.validateReviewText(reviewText);

  ButtonStatus get buttonStatus {
    return rating != 0 && ReviewValidator.validateReviewText(reviewText) == null
        ? ButtonStatus.enabled
        : ButtonStatus.disabled;
  }
}
