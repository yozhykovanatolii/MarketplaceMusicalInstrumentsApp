sealed class ListingEvent {}

final class ListingInitializeEvent extends ListingEvent {}

final class ListingSearchEvent extends ListingEvent {
  final String? searchText;

  ListingSearchEvent(this.searchText);
}

final class AverageRatingListingClickedEvent extends ListingEvent {
  final int? value;

  AverageRatingListingClickedEvent(this.value);
}
