import 'package:marketplace_musical_instruments_app/core/state/button_status.dart';
import 'package:marketplace_musical_instruments_app/core/state/form_status.dart';
import 'package:marketplace_musical_instruments_app/core/validator/review_validator.dart';
import 'package:marketplace_musical_instruments_app/domain/entity/review_summary_entity.dart';

class ReviewState {
  final ReviewSummaryEntity reviewSummaryEntity;
  final double rating;
  final String reviewText;
  final FormStatus formStatus;
  final String errorText;

  ReviewState({
    required this.reviewSummaryEntity,
    required this.rating,
    required this.reviewText,
    required this.formStatus,
    required this.errorText,
  });

  factory ReviewState.initial() {
    return ReviewState(
      reviewSummaryEntity: ReviewSummaryEntity.initial(),
      rating: 0,
      reviewText: '',
      errorText: '',
      formStatus: FormStatus.initial,
    );
  }

  ReviewState copyWith({
    ReviewSummaryEntity? reviewSummaryEntity,
    double? rating,
    String? reviewText,
    FormStatus? formStatus,
    String? errorText,
  }) {
    return ReviewState(
      reviewSummaryEntity: reviewSummaryEntity ?? this.reviewSummaryEntity,
      rating: rating ?? this.rating,
      reviewText: reviewText ?? this.reviewText,
      formStatus: formStatus ?? this.formStatus,
      errorText: errorText ?? this.errorText,
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
