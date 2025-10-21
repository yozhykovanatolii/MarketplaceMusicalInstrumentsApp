sealed class FavouriteListingsEvent {}

final class FavouriteListingsFetchEvent extends FavouriteListingsEvent {}

final class UserFavouriteListingsIdFetchEvent extends FavouriteListingsEvent {}

final class FavouriteListingAddEvent extends FavouriteListingsEvent {
  final String listingId;

  FavouriteListingAddEvent(this.listingId);
}
