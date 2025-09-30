import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/data/repository/listing_repository.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/listing/listing_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/listing/listing_state.dart';

class ListingBloc extends Bloc<ListingEvent, ListingState> {
  final _listingRepository = ListingRepository();

  ListingBloc() : super(ListingInitial()) {
    on<ListingInitializeEvent>(_initializeListings);
  }

  Future<void> _initializeListings(
    ListingInitializeEvent event,
    Emitter<ListingState> emit,
  ) async {
    emit(ListingLoading());
    try {
      final listings = await _listingRepository.getAllListingExceptUsers();
      emit(ListingSuccess(listings));
    } catch (exception) {
      emit(ListingFailure(exception.toString()));
    }
  }
}
