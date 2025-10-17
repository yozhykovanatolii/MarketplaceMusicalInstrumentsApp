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
  final double rating;
  final int reviewerCounter;

  AddReviewEvent({
    required this.listingId,
    required this.rating,
    required this.reviewerCounter,
  });
}
