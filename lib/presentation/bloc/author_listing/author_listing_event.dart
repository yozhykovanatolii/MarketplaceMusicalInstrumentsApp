import 'package:marketplace_musical_instruments_app/data/model/listing_model.dart';

sealed class AuthorListingEvent {}

final class AuthorListingsFetchEvent extends AuthorListingEvent {}

final class AuthorListingDeleteEvent extends AuthorListingEvent {
  final ListingModel listing;

  AuthorListingDeleteEvent(this.listing);
}
