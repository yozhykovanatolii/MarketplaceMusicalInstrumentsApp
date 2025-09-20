import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/data/repository/listing_repository.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/add_and_edit_listing/add_and_edit_listing_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/add_and_edit_listing/add_and_edit_listing_state.dart';

class AddAndEditListingBloc
    extends Bloc<AddAndEditListingEvent, AddAndEditListingState> {
  final _listingRepository = ListingRepository();

  AddAndEditListingBloc() : super(AddAndEditListingState.initial()) {
    on<AddListingPhotoEvent>(_onAddListingPhotoInList);
    on<DeleteListingPhotoEvent>(_onDeleteListingPhotoFromList);
  }

  Future<void> _onAddListingPhotoInList(
    AddListingPhotoEvent event,
    Emitter<AddAndEditListingState> emit,
  ) async {
    try {
      final photoUrl = await _listingRepository.getListingPhotoUrl();
      final updatedPhotos = List<String>.from(state.photos)..add(photoUrl);
      emit(state.copyWith(photos: updatedPhotos));
    } catch (exception) {
      print('Error');
      emit(state.copyWith(errorMessage: exception.toString()));
    }
  }

  void _onDeleteListingPhotoFromList(
    DeleteListingPhotoEvent event,
    Emitter<AddAndEditListingState> emit,
  ) {
    String photoUrl = event.photoUrl;
    final updatedList = List<String>.from(state.photos)..remove(photoUrl);
    emit(state.copyWith(photos: updatedList));
  }
}
