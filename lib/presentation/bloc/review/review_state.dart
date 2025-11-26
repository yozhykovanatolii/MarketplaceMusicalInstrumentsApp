import 'package:marketplace_musical_instruments_app/core/validator/review_validator.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/save_listing/save_listing_state.dart';

class ReviewState {
  final Map<String, dynamic> reviewsAndRating;
  final double rating;
  final String reviewText;

  ReviewState({
    required this.reviewsAndRating,
    required this.rating,
    required this.reviewText,
  });

  factory ReviewState.initial() {
    return ReviewState(
      reviewsAndRating: {},
      rating: 0,
      reviewText: '',
    );
  }

  ReviewState copyWith({
    Map<String, dynamic>? reviewsAndRating,
    double? rating,
    String? reviewText,
  }) {
    return ReviewState(
      reviewsAndRating: reviewsAndRating ?? this.reviewsAndRating,
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
