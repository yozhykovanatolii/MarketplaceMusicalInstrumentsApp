import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/exception/auth/user_not_found_exception.dart';
import 'package:marketplace_musical_instruments_app/data/repository/review_repository.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/review/review_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/review/review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  final ReviewRepository reviewRepository;

  ReviewBloc(this.reviewRepository) : super(ReviewState.initial()) {
    on<ReviewAndRatingFetchEvent>(_fetchListingReviewsAndRating);
    on<AverageRatingChangeEvent>(_changeAverageRatingBar);
    on<ReviewTextChangeEvent>(_changeReviewText);
    on<AddReviewEvent>(_addUserReview);
  }

  void _changeAverageRatingBar(
    AverageRatingChangeEvent event,
    Emitter<ReviewState> emit,
  ) {
    emit(state.copyWith(rating: event.rating));
  }

  void _changeReviewText(
    ReviewTextChangeEvent event,
    Emitter<ReviewState> emit,
  ) {
    final reviewText = event.reviewText;
    if (reviewText == null) return;
    emit(state.copyWith(reviewText: reviewText));
  }

  Future<void> _fetchListingReviewsAndRating(
    ReviewAndRatingFetchEvent event,
    Emitter<ReviewState> emit,
  ) async {
    await emit.forEach(
      reviewRepository.getListingRatingAndAllReviews(event.listingId),
      onData: (data) => state.copyWith(reviewSummaryEntity: data),
    );
  }

  Future<void> _addUserReview(
    AddReviewEvent event,
    Emitter<ReviewState> emit,
  ) async {
    try {
      await reviewRepository.saveReview(
        state.rating.toInt(),
        state.reviewText,
        event.rating,
        event.reviewerCounter,
        event.listingId,
      );
    } on UserNotFoundException catch (exception) {
      print(exception.errorMessage);
    }
  }
}
