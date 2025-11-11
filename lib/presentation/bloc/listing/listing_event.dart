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

final class LocationChangedEvent extends ListingEvent {
  final double latitude;
  final double longitude;

  LocationChangedEvent(this.latitude, this.longitude);
}

final class DistanceIncreaseEvent extends ListingEvent {}

final class DistanceDecreaseEvent extends ListingEvent {}

final class ClearFilterEvent extends ListingEvent {}

final class ListingFilterEvent extends ListingEvent {}
