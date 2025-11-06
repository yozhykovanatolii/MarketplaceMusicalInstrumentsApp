import 'package:marketplace_musical_instruments_app/data/model/listing_model.dart';

enum ListingStatus { initial, loading, success, failure }

class ListingState {
  final List<ListingModel> listings;
  final String errorMessage;
  final int selectedAverageRating;
  final int startPrice;
  final int endPrice;
  final List<String> selectedCategories;
  final Map<String, double> location;
  final ListingStatus status;

  ListingState({
    required this.listings,
    required this.errorMessage,
    required this.selectedAverageRating,
    required this.startPrice,
    required this.endPrice,
    required this.selectedCategories,
    required this.location,
    required this.status,
  });

  factory ListingState.initial() {
    return ListingState(
      listings: [],
      errorMessage: '',
      selectedAverageRating: 0,
      startPrice: 0,
      endPrice: 20,
      selectedCategories: [],
      location: {'latitude': 37.42796133580664, 'longitude': -122.085749655962},
      status: ListingStatus.initial,
    );
  }

  ListingState copyWith({
    List<ListingModel>? listings,
    String? errorMessage,
    int? selectedAverageRating,
    int? startPrice,
    int? endPrice,
    List<String>? selectedCategories,
    Map<String, double>? location,
    ListingStatus? status,
  }) {
    return ListingState(
      listings: listings ?? this.listings,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedAverageRating:
          selectedAverageRating ?? this.selectedAverageRating,
      startPrice: startPrice ?? this.startPrice,
      endPrice: endPrice ?? this.endPrice,
      selectedCategories: selectedCategories ?? this.selectedCategories,
      location: location ?? this.location,
      status: status ?? this.status,
    );
  }
}
