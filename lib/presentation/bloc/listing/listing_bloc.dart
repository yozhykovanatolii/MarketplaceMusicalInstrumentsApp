import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/exception/get_all_listings_except_user_exception.dart';
import 'package:marketplace_musical_instruments_app/core/exception/listing_filtration_exception.dart';
import 'package:marketplace_musical_instruments_app/core/exception/listing_searching_exception.dart';
import 'package:marketplace_musical_instruments_app/data/repository/listing_repository.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/listing/listing_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/listing/listing_state.dart';

class ListingBloc extends Bloc<ListingEvent, ListingState> {
  final _listingRepository = ListingRepository();

  ListingBloc() : super(ListingState.initial()) {
    on<ListingInitializeEvent>(_initializeListings);
    on<ListingSearchEvent>(_searchListings);
    on<AverageRatingListingClickedEvent>(_chooseAverageRating);
    on<PriceRangeSelectedEvent>(_choosePriceRange);
    on<ListingCategorySelectedEvent>(_chooseListingCategory);
    on<ClearFilterEvent>(_clearFilter);
    on<ListingFilterEvent>(_filterListings);
  }

  Future<void> _initializeListings(
    ListingInitializeEvent event,
    Emitter<ListingState> emit,
  ) async {
    emit(state.copyWith(status: ListingStatus.loading));
    try {
      final listings = await _listingRepository.getAllListingExceptUsers();
      emit(state.copyWith(listings: listings, status: ListingStatus.success));
    } on GetAllListingsExceptUserException catch (exception) {
      emit(
        state.copyWith(
          errorMessage: exception.errorMessage,
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
    } on ListingSearchingException catch (exception) {
      emit(
        state.copyWith(
          errorMessage: exception.errorMessage,
          status: ListingStatus.failure,
        ),
      );
    }
  }

  void _chooseAverageRating(
    AverageRatingListingClickedEvent event,
    Emitter<ListingState> emit,
  ) {
    final currentSelectedAverageRating = event.rating;
    final previousSelectedAverageRating = state.selectedAverageRating;
    if (previousSelectedAverageRating == currentSelectedAverageRating) {
      return;
    }
    emit(state.copyWith(selectedAverageRating: currentSelectedAverageRating));
  }

  void _choosePriceRange(
    PriceRangeSelectedEvent event,
    Emitter<ListingState> emit,
  ) {
    final int startPrice = event.start.toInt();
    final int endPrice = event.end.toInt();
    emit(state.copyWith(startPrice: startPrice, endPrice: endPrice));
  }

  void _chooseListingCategory(
    ListingCategorySelectedEvent event,
    Emitter<ListingState> emit,
  ) {
    final updatedCategories = List<String>.from(state.selectedCategories);
    if (updatedCategories.contains(event.category)) {
      updatedCategories.remove(event.category);
    } else {
      updatedCategories.add(event.category);
    }
    print(updatedCategories);
    emit(state.copyWith(selectedCategories: updatedCategories));
  }

  void _clearFilter(
    ClearFilterEvent event,
    Emitter<ListingState> emit,
  ) {
    emit(
      state.copyWith(
        selectedAverageRating: 0,
        startPrice: 0,
        endPrice: 20,
        selectedCategories: [],
      ),
    );
  }

  Future<void> _filterListings(
    ListingFilterEvent event,
    Emitter<ListingState> emit,
  ) async {
    emit(state.copyWith(status: ListingStatus.loading));
    try {
      final listings = await _listingRepository.filterListings(
        state.selectedCategories,
        state.startPrice,
        state.endPrice,
        state.selectedAverageRating,
      );
      emit(state.copyWith(listings: listings, status: ListingStatus.success));
    } on ListingFiltrationException catch (exception) {
      emit(
        state.copyWith(
          errorMessage: exception.errorMessage,
          status: ListingStatus.failure,
        ),
      );
    }
  }
}
