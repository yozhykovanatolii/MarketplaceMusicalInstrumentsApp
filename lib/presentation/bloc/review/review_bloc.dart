import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/review/review_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/review/review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  ReviewBloc() : super(ReviewState.initial()) {
    on<AverageRatingChangeEvent>(_changeAverageRatingBar);
    on<ReviewTextChangeEvent>(_changeReviewText);
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
}
