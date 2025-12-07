import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/exception/geolocation_exception.dart';
import 'package:marketplace_musical_instruments_app/core/exception/listing/listing_filtration_exception.dart';
import 'package:marketplace_musical_instruments_app/core/exception/listing/listing_searching_exception.dart';
import 'package:marketplace_musical_instruments_app/core/exception/permission_denied_exception.dart';
import 'package:marketplace_musical_instruments_app/data/repository/geolocation_repository.dart';
import 'package:marketplace_musical_instruments_app/data/repository/listing_repository.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/listing/listing_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/listing/state/listing_filters.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/listing/state/listing_state.dart';

class ListingBloc extends Bloc<ListingEvent, ListingState> {
  final ListingRepository listingRepository;
  final GeolocationRepository geolocationRepository;

  ListingBloc(
    this.listingRepository,
    this.geolocationRepository,
  ) : super(ListingState.initial()) {
    on<ListingInitializeEvent>(_initializeListings);
    on<ListingSearchEvent>(_searchListings);
    on<AverageRatingListingClickedEvent>(_chooseAverageRating);
    on<PriceRangeSelectedEvent>(_choosePriceRange);
    on<ListingCategorySelectedEvent>(_chooseListingCategory);
    on<ClearFilterEvent>(_clearFilter);
    on<LocationChangedEvent>(_changeLocation);
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
      final listings = await listingRepository.filterListings(
        state.listingFilters.selectedCategories,
        state.listingFilters.startPrice,
        state.listingFilters.endPrice,
        state.listingFilters.selectedAverageRating,
        state.location['latitude']!,
        state.location['longitude']!,
        state.listingFilters.distance,
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
      final location = await geolocationRepository.getCurrentLocation();
      final updatedUserLocation = Map<String, double>.from(location);
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
      final foundListings = await listingRepository.searchListings(searchText);
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

  void _changeLocation(
    LocationChangedEvent event,
    Emitter<ListingState> emit,
  ) {
    final updatedLocation = Map<String, double>.from(
      state.location,
    );
    updatedLocation.addAll({
      'latitude': event.latitude,
      'longitude': event.longitude,
    });
    emit(state.copyWith(location: updatedLocation));
  }

  void _chooseAverageRating(
    AverageRatingListingClickedEvent event,
    Emitter<ListingState> emit,
  ) {
    final currentSelectedAverageRating = event.rating;
    final previousSelectedAverageRating =
        state.listingFilters.selectedAverageRating;
    if (previousSelectedAverageRating == currentSelectedAverageRating) {
      return;
    }
    final newListingFilters = _updateFilters(
      selectedAverageRating: currentSelectedAverageRating,
    );
    emit(state.copyWith(listingFilters: newListingFilters));
  }

  void _choosePriceRange(
    PriceRangeSelectedEvent event,
    Emitter<ListingState> emit,
  ) {
    final int startPrice = event.start.toInt();
    final int endPrice = event.end.toInt();
    final newListingFilters = _updateFilters(
      startPrice: startPrice,
      endPrice: endPrice,
    );
    emit(state.copyWith(listingFilters: newListingFilters));
  }

  void _chooseListingCategory(
    ListingCategorySelectedEvent event,
    Emitter<ListingState> emit,
  ) {
    final updatedCategories = List<String>.from(
      state.listingFilters.selectedCategories,
    );
    if (updatedCategories.contains(event.category)) {
      updatedCategories.remove(event.category);
    } else {
      updatedCategories.add(event.category);
    }
    final newListingFilters = _updateFilters(
      selectedCategories: updatedCategories,
    );
    emit(state.copyWith(listingFilters: newListingFilters));
  }

  void _clearFilter(
    ClearFilterEvent event,
    Emitter<ListingState> emit,
  ) {
    final newListingFilters = _updateFilters(
      selectedAverageRating: 0,
      startPrice: 0,
      endPrice: 10000,
      selectedCategories: [],
    );
    emit(state.copyWith(listingFilters: newListingFilters));
  }

  void _decreaseDistance(
    DistanceDecreaseEvent event,
    Emitter<ListingState> emit,
  ) {
    final distance = state.listingFilters.distance;
    if (distance <= 1) return;
    final newListingFilters = _updateFilters(distance: distance - 1);
    emit(state.copyWith(listingFilters: newListingFilters));
  }

  void _increaseDistance(
    DistanceIncreaseEvent event,
    Emitter<ListingState> emit,
  ) {
    final distance = state.listingFilters.distance;
    final newListingFilters = _updateFilters(distance: distance + 1);
    emit(state.copyWith(listingFilters: newListingFilters));
  }

  ListingFilters _updateFilters({
    int? selectedAverageRating,
    int? startPrice,
    int? endPrice,
    List<String>? selectedCategories,
    int? distance,
  }) {
    return state.listingFilters.copyWith(
      selectedAverageRating: selectedAverageRating,
      startPrice: startPrice,
      endPrice: endPrice,
      selectedCategories: selectedCategories,
      distance: distance,
    );
  }

  Future<void> _filterListings(
    ListingFilterEvent event,
    Emitter<ListingState> emit,
  ) async {
    emit(state.copyWith(status: ListingStatus.loading));
    await _fetchListings(emit);
  }
}
