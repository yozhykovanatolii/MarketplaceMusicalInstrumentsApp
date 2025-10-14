import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/util/calculation_rating_procent_util.dart';
import 'package:marketplace_musical_instruments_app/data/repository/review_repository.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/review/review_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/review/review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  final _reviewRepository = ReviewRepository();

  ReviewBloc() : super(ReviewState.initial()) {
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
      _reviewRepository.getListingRatingAndAllReviews(event.listingId),
      onData: (data) {
        data['ratingsProcent'] =
            CalculationRatingProcentUtil.calculateProcentForEachRatings(
              data['reviews'] ?? [],
              data['ratingAndReviewerCount']?['reviewerCount'] ?? 0,
            );
        return state.copyWith(reviewsAndRating: data);
      },
    );
  }

  Future<void> _addUserReview(
    AddReviewEvent event,
    Emitter<ReviewState> emit,
  ) async {
    try {
      await _reviewRepository.saveReview(
        state.rating.toInt(),
        state.reviewText,
        event.reviews,
        event.listingId,
      );
    } catch (exception) {
      print(exception.toString());
    }
  }
}
