sealed class AuthorListingEvent {}

final class AuthorListingsFetchEvent extends AuthorListingEvent {}

final class AuthorListingDeleteEvent extends AuthorListingEvent {
  final String listingId;

  AuthorListingDeleteEvent(this.listingId);
}
