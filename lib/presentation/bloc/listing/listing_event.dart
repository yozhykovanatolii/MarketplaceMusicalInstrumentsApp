sealed class ListingEvent {}

final class ListingInitializeEvent extends ListingEvent {}

final class ListingSearchEvent extends ListingEvent {
  final String? searchText;

  ListingSearchEvent(this.searchText);
}

final class AverageRatingListingClickedEvent extends ListingEvent {
  final int rating;

  AverageRatingListingClickedEvent(this.rating);
}

final class PriceRangeSelectedEvent extends ListingEvent {
  final double start;
  final double end;

  PriceRangeSelectedEvent(this.start, this.end);
}

final class ListingCategorySelectedEvent extends ListingEvent {
  final String category;

  ListingCategorySelectedEvent(this.category);
}
