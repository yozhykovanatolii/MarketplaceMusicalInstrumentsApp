import 'package:marketplace_musical_instruments_app/data/model/listing_model.dart';

sealed class AuthorListingEvent {}

final class AuthorListingsFetchEvent extends AuthorListingEvent {}

final class AuthorListingsSucceedEvent extends AuthorListingEvent {
  final List<ListingModel> listings;

  AuthorListingsSucceedEvent(this.listings);
}

final class AuthorListingsFailedEvent extends AuthorListingEvent {
  final String errorMessage;

  AuthorListingsFailedEvent(this.errorMessage);
}

final class AuthorListingDeleteEvent extends AuthorListingEvent {
  final String listingId;

  AuthorListingDeleteEvent(this.listingId);
}
