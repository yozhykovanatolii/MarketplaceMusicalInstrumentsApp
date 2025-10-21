import 'package:marketplace_musical_instruments_app/data/model/listing_model.dart';

enum FavouriteListingsStatus { initial, loading, success, failure }

class FavouriteListingsState {
  final List<ListingModel> favouriteListings;
  final List<String> favouriteListingsId;
  final String errorMessage;
  final FavouriteListingsStatus status;

  FavouriteListingsState({
    required this.favouriteListings,
    required this.favouriteListingsId,
    required this.errorMessage,
    required this.status,
  });

  factory FavouriteListingsState.initial() {
    return FavouriteListingsState(
      favouriteListings: [],
      favouriteListingsId: [],
      errorMessage: '',
      status: FavouriteListingsStatus.initial,
    );
  }

  FavouriteListingsState copyWith({
    List<ListingModel>? favouriteListings,
    List<String>? favouriteListingsId,
    String? errorMessage,
    FavouriteListingsStatus? status,
  }) {
    return FavouriteListingsState(
      favouriteListings: favouriteListings ?? this.favouriteListings,
      favouriteListingsId: favouriteListingsId ?? this.favouriteListingsId,
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
    );
  }
}
