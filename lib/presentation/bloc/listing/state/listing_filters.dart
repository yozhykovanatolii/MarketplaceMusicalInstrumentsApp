class ListingFilters {
  final int selectedAverageRating;
  final int startPrice;
  final int endPrice;
  final List<String> selectedCategories;
  final int distance;

  ListingFilters({
    required this.selectedAverageRating,
    required this.startPrice,
    required this.endPrice,
    required this.selectedCategories,
    required this.distance,
  });

  factory ListingFilters.initial() {
    return ListingFilters(
      selectedAverageRating: 0,
      startPrice: 1,
      endPrice: 500,
      selectedCategories: [],
      distance: 1,
    );
  }

  ListingFilters copyWith({
    int? selectedAverageRating,
    int? startPrice,
    int? endPrice,
    List<String>? selectedCategories,
    int? distance,
  }) {
    return ListingFilters(
      selectedAverageRating:
          selectedAverageRating ?? this.selectedAverageRating,
      startPrice: startPrice ?? this.startPrice,
      endPrice: endPrice ?? this.endPrice,
      selectedCategories: selectedCategories ?? this.selectedCategories,
      distance: distance ?? this.distance,
    );
  }
}
