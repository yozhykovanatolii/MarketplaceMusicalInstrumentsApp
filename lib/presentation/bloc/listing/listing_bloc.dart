import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/exception/geolocation_exception.dart';
import 'package:marketplace_musical_instruments_app/core/exception/listing/listing_filtration_exception.dart';
import 'package:marketplace_musical_instruments_app/core/exception/listing/listing_searching_exception.dart';
import 'package:marketplace_musical_instruments_app/core/exception/permission_denied_exception.dart';
import 'package:marketplace_musical_instruments_app/core/service/geolocation_service.dart';
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
    on<DistanceDecreaseEvent>(_decreaseDistance);
    on<DistanceIncreaseEvent>(_increaseDistance);
    on<ListingFilterEvent>(_filterListings);
  }

  Future<void> _initializeListings(
    ListingInitializeEvent event,
    Emitter<ListingState> emit,
  ) async {
    emit(state.copyWith(status: ListingStatus.loading));
    await _getUserLocation(emit);
    await _fetchListings(emit);
  }

  Future<void> _fetchListings(Emitter<ListingState> emit) async {
    try {
      final listings = await _listingRepository.filterListings(
        state.selectedCategories,
        state.startPrice,
        state.endPrice,
        state.selectedAverageRating,
        state.location['latitude']!,
        state.location['longitude']!,
        state.distance,
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

  Future<void> _getUserLocation(Emitter<ListingState> emit) async {
    try {
      final location = await GeolocationService.getCurrentLocation();
      final updatedUserLocation = Map<String, double>.from(
        state.location,
      );
      updatedUserLocation.addAll({
        'latitude': location.latitude,
        'longitude': location.longitude,
      });
      emit(state.copyWith(location: updatedUserLocation));
    } on PermissionDeniedException catch (exception) {
      emit(
        state.copyWith(
          errorMessage: exception.errorMessage,
          status: ListingStatus.failure,
        ),
      );
    } on GeolocationException catch (exception) {
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

  void _decreaseDistance(
    DistanceDecreaseEvent event,
    Emitter<ListingState> emit,
  ) {
    final distance = state.distance;
    if (distance <= 1) return;
    emit(state.copyWith(distance: distance - 1));
  }

  void _increaseDistance(
    DistanceIncreaseEvent event,
    Emitter<ListingState> emit,
  ) {
    final distance = state.distance;
    emit(state.copyWith(distance: distance + 1));
  }

  Future<void> _filterListings(
    ListingFilterEvent event,
    Emitter<ListingState> emit,
  ) async {
    emit(state.copyWith(status: ListingStatus.loading));
    await _fetchListings(emit);
  }
}
