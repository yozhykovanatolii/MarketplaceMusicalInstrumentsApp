import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/data/repository/listing_repository.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/listing/listing_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/listing/listing_state.dart';

class ListingBloc extends Bloc<ListingEvent, ListingState> {
  final _listingRepository = ListingRepository();

  ListingBloc() : super(ListingState.initial()) {
    on<ListingInitializeEvent>(_initializeListings);
    on<ListingSearchEvent>(_searchListings);
    on<AverageRatingListingClickedEvent>(_chooseAverageRating);
  }

  Future<void> _initializeListings(
    ListingInitializeEvent event,
    Emitter<ListingState> emit,
  ) async {
    emit(state.copyWith(status: ListingStatus.loading));
    try {
      final listings = await _listingRepository.getAllListingExceptUsers();
      emit(state.copyWith(listings: listings, status: ListingStatus.success));
    } catch (exception) {
      emit(
        state.copyWith(
          errorMessage: exception.toString(),
          status: ListingStatus.failure,
        ),
      );
    }
  }

  Future<void> _searchListings(
    ListingSearchEvent event,
    Emitter<ListingState> emit,
  ) async {
    final searchText = event.searchText;
    if (searchText == null) return;
    emit(state.copyWith(status: ListingStatus.loading));
    try {
      final foundListings = await _listingRepository.searchListings(searchText);
      emit(
        state.copyWith(listings: foundListings, status: ListingStatus.loading),
      );
    } catch (exception) {
      emit(
        state.copyWith(
          errorMessage: exception.toString(),
          status: ListingStatus.failure,
        ),
      );
    }
  }

  void _chooseAverageRating(
    AverageRatingListingClickedEvent event,
    Emitter<ListingState> emit,
  ) {
    final currentSelectedAverageRating = event.value;
    final previousSelectedAverageRating = state.selectedAverageRating;
    if (previousSelectedAverageRating == currentSelectedAverageRating ||
        currentSelectedAverageRating == null) {
      return;
    }
    emit(state.copyWith(selectedAverageRating: currentSelectedAverageRating));
  }
}
