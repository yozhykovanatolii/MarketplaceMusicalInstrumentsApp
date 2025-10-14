import 'package:marketplace_musical_instruments_app/data/model/review_model.dart';

sealed class ReviewEvent {}

final class ReviewAndRatingFetchEvent extends ReviewEvent {
  final String listingId;

  ReviewAndRatingFetchEvent(this.listingId);
}

final class AverageRatingChangeEvent extends ReviewEvent {
  final double rating;

  AverageRatingChangeEvent(this.rating);
}

final class ReviewTextChangeEvent extends ReviewEvent {
  final String? reviewText;

  ReviewTextChangeEvent(this.reviewText);
}

final class AddReviewEvent extends ReviewEvent {
  final String listingId;
  final List<ReviewModel> reviews;

  AddReviewEvent(this.listingId, this.reviews);
}
