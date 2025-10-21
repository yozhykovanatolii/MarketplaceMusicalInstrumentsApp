import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/data/repository/user_repository.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/favourite_listings/favourite_listings_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/favourite_listings/favourite_listings_state.dart';

class FavouriteListingsBloc
    extends Bloc<FavouriteListingsEvent, FavouriteListingsState> {
  final _userRepository = UserRepository();

  FavouriteListingsBloc() : super(FavouriteListingsState.initial()) {
    on<UserFavouriteListingsIdFetchEvent>(_fetchUserFavouriteListingsId);
    on<FavouriteListingsFetchEvent>(_fetchFavouriteListings);
    on<FavouriteListingAddEvent>(_addListingInFavourites);
  }

  Future<void> _fetchUserFavouriteListingsId(
    UserFavouriteListingsIdFetchEvent event,
    Emitter<FavouriteListingsState> emit,
  ) async {
    final favouriteListingsId = await _userRepository.getFavouriteListingsId();
    emit(
      state.copyWith(favouriteListingsId: favouriteListingsId),
    );
  }

  Future<void> _fetchFavouriteListings(
    FavouriteListingsFetchEvent event,
    Emitter<FavouriteListingsState> emit,
  ) async {
    emit(
      state.copyWith(status: FavouriteListingsStatus.loading),
    );
    await emit.forEach(
      _userRepository.getUserFavouriteListings(),
      onData: (data) {
        return state.copyWith(
          favouriteListings: data,
          status: FavouriteListingsStatus.success,
        );
      },
      onError: (error, stackTrace) => state.copyWith(
        errorMessage: error.toString(),
        status: FavouriteListingsStatus.failure,
      ),
    );
  }

  Future<void> _addListingInFavourites(
    FavouriteListingAddEvent event,
    Emitter<FavouriteListingsState> emit,
  ) async {
    final updatedFavouritesId = List<String>.from(state.favouriteListingsId);
    if (updatedFavouritesId.contains(event.listingId)) {
      updatedFavouritesId.remove(event.listingId);
    } else {
      updatedFavouritesId.add(event.listingId);
    }
    emit(state.copyWith(favouriteListingsId: updatedFavouritesId));
    await _userRepository.updateUserFavourites(updatedFavouritesId);
  }
}
