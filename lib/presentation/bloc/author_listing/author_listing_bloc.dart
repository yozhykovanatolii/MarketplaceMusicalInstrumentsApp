import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/exception/auth/user_not_found_exception.dart';
import 'package:marketplace_musical_instruments_app/core/exception/listing/user_listings_exception.dart';
import 'package:marketplace_musical_instruments_app/domain/entity/listing_entity.dart';
import 'package:marketplace_musical_instruments_app/domain/repository/listing_repository.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/author_listing/author_listing_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/author_listing/author_listing_state.dart';

class AuthorListingBloc extends Bloc<AuthorListingEvent, AuthorListingState> {
  final ListingRepository listingRepository;

  AuthorListingBloc(this.listingRepository)
    : super(AuthorListingInitialState()) {
    on<AuthorListingsFetchEvent>(_fetchAuthorListings);
    on<AuthorListingDeleteEvent>(_deleteAuthorListing);
  }

  Future<void> _fetchAuthorListings(
    AuthorListingsFetchEvent event,
    Emitter<AuthorListingState> emit,
  ) async {
    emit(AuthorListingLoadingState());
    await emit.forEach<List<ListingEntity>>(
      listingRepository.getUserListings(),
      onData: (authorListings) => AuthorListingSuccessState(
        authorListings,
      ),
      onError: (error, stackTrace) {
        final String errorMessage = error is UserNotFoundException
            ? error.errorMessage
            : (error as UserListingsException).errorMessage;
        return AuthorListingFailureState(
          errorMessage,
        );
      },
    );
  }

  Future<void> _deleteAuthorListing(
    AuthorListingDeleteEvent event,
    Emitter<AuthorListingState> emit,
  ) async {
    await listingRepository.deleteAuthorListing(event.listingId);
  }
}
