import 'package:marketplace_musical_instruments_app/domain/entity/listing_entity.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/listing/state/listing_filters.dart';

enum ListingStatus { initial, loading, success, failure }

class ListingState {
  final List<ListingEntity> listings;
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
      location: {'latitude': 47.8858599, 'longitude': 35.0093512},
      listingFilters: ListingFilters.initial(),
      status: ListingStatus.initial,
    );
  }

  ListingState copyWith({
    List<ListingEntity>? listings,
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
