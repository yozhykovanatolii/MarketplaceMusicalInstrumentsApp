import 'package:marketplace_musical_instruments_app/domain/entity/listing_entity.dart';

sealed class AuthorListingState {}

final class AuthorListingInitialState extends AuthorListingState {}

final class AuthorListingLoadingState extends AuthorListingState {}

final class AuthorListingSuccessState extends AuthorListingState {
  final List<ListingEntity> authorListings;

  AuthorListingSuccessState(this.authorListings);
}

final class AuthorListingFailureState extends AuthorListingState {
  final String errorMessage;

  AuthorListingFailureState(this.errorMessage);
}
