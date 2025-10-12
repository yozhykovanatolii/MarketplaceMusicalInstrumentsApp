import 'package:marketplace_musical_instruments_app/data/model/listing_model.dart';

enum ListingStatus { initial, loading, success, failure }

class ListingState {
  final List<ListingModel> listings;
  final String errorMessage;
  final int selectedAverageRating;
  final int startPrice;
  final int endPrice;
  final List<String> selectedCategories;
  final ListingStatus status;

  ListingState({
    required this.listings,
    required this.errorMessage,
    required this.selectedAverageRating,
    required this.startPrice,
    required this.endPrice,
    required this.selectedCategories,
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
      status: status ?? this.status,
    );
  }
}
