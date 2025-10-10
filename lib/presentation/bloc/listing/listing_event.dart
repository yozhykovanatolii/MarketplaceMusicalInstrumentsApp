sealed class ListingEvent {}

final class ListingInitializeEvent extends ListingEvent {}

final class ListingSearchEvent extends ListingEvent {
  final String? searchText;

  ListingSearchEvent(this.searchText);
}
