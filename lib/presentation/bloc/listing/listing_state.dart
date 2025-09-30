import 'package:marketplace_musical_instruments_app/data/model/listing_model.dart';

sealed class ListingState {}

final class ListingInitial extends ListingState {}

final class ListingLoading extends ListingState {}

final class ListingSuccess extends ListingState {
  final List<ListingModel> listings;

  ListingSuccess(this.listings);
}

final class ListingFailure extends ListingState {
  final String errorMessage;

  ListingFailure(this.errorMessage);
}
