import 'package:marketplace_musical_instruments_app/data/model/listing_model.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/listing/state/listing_filters.dart';

enum ListingStatus { initial, loading, success, failure }

class ListingState {
  final List<ListingModel> listings;
  final String errorMessage;
  final Map<String, double> location;
  final ListingFilters listingFilters;
  final ListingStatus status;

  ListingState({
    required this.listings,
    required this.errorMessage,
    required this.location,
    required this.listingFilters,
    required this.status,
  });

  factory ListingState.initial() {
    return ListingState(
      listings: [],
      errorMessage: '',
      location: {'latitude': 37.42796133580664, 'longitude': -122.085749655962},
      listingFilters: ListingFilters.initial(),
      status: ListingStatus.initial,
    );
  }

  ListingState copyWith({
    List<ListingModel>? listings,
    String? errorMessage,
    Map<String, double>? location,
    ListingFilters? listingFilters,
    ListingStatus? status,
  }) {
    return ListingState(
      listings: listings ?? this.listings,
      errorMessage: errorMessage ?? this.errorMessage,
      location: location ?? this.location,
      listingFilters: listingFilters ?? this.listingFilters,
      status: status ?? this.status,
    );
  }
}
