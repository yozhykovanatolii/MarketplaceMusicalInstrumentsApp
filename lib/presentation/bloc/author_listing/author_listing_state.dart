import 'package:marketplace_musical_instruments_app/data/model/listing_model.dart';

sealed class AuthorListingState {}

final class AuthorListingInitialState extends AuthorListingState {}

final class AuthorListingLoadingState extends AuthorListingState {}

final class AuthorListingSuccessState extends AuthorListingState {
  final List<ListingModel> authorListings;

  AuthorListingSuccessState(this.authorListings);
}

final class AuthorListingFailureState extends AuthorListingState {
  final String errorMessage;

  AuthorListingFailureState(this.errorMessage);
}
