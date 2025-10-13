sealed class ReviewEvent {}

final class AverageRatingChangeEvent extends ReviewEvent {
  final double rating;

  AverageRatingChangeEvent(this.rating);
}

final class ReviewTextChangeEvent extends ReviewEvent {
  final String? reviewText;

  ReviewTextChangeEvent(this.reviewText);
}
