import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/data/repository/listing_repository.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/author_listing/author_listing_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/author_listing/author_listing_state.dart';

class AuthorListingBloc extends Bloc<AuthorListingEvent, AuthorListingState> {
  final _listingRepository = ListingRepository();

  AuthorListingBloc() : super(AuthorListingInitialState()) {
    on<AuthorListingsFetchEvent>(_fetchAuthorListings);
    on<AuthorListingDeleteEvent>(_deleteAuthorListing);
  }

  Future<void> _fetchAuthorListings(
    AuthorListingsFetchEvent event,
    Emitter<AuthorListingState> emit,
  ) async {
    emit(AuthorListingLoadingState());
    try {
      final authorListings = await _listingRepository.getUserListings();
      emit(AuthorListingSuccessState(authorListings));
    } catch (exception) {
      emit(AuthorListingFailureState(exception.toString()));
    }
  }

  Future<void> _deleteAuthorListing(
    AuthorListingDeleteEvent event,
    Emitter<AuthorListingState> emit,
  ) async {
    await _listingRepository.deleteAuthorListing(event.listingId);
  }
}
