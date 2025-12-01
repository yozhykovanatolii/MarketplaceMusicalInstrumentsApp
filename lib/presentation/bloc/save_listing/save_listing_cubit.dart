import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/exception/geolocation_exception.dart';
import 'package:marketplace_musical_instruments_app/core/exception/permission_denied_exception.dart';
import 'package:marketplace_musical_instruments_app/core/exception/photo_not_selected_exception.dart';
import 'package:marketplace_musical_instruments_app/core/exception/auth/user_not_found_exception.dart';
import 'package:marketplace_musical_instruments_app/data/model/listing_model.dart';
import 'package:marketplace_musical_instruments_app/data/repository/geolocation_repository.dart';
import 'package:marketplace_musical_instruments_app/data/repository/listing_repository.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/save_listing/save_listing_state.dart';

class SaveListingCubit extends Cubit<SaveListingState> {
  final _listingRepository = ListingRepository();
  final _geolocationRepository = GeolocationRepository();

  SaveListingCubit() : super(SaveListingState.initial());

  Future<void> onAddListingPhotoInList() async {
    try {
      final photoUrl = await _listingRepository.getListingPhotoUrl();
      final updatedPhotos = List<String>.from(state.photos)..add(photoUrl);
      emit(state.copyWith(photos: updatedPhotos));
    } on PermissionDeniedException catch (exception) {
      emit(state.copyWith(errorMessage: exception.errorMessage));
    } on PhotoNotSelectedException catch (exception) {
      emit(state.copyWith(errorMessage: exception.errorMessage));
    } finally {
      emit(state.copyWith(errorMessage: ''));
    }
  }

  void onDeleteListingPhotoFromList(String photoUrl) {
    final updatedList = List<String>.from(state.photos)..remove(photoUrl);
    emit(state.copyWith(photos: updatedList));
  }

  Future<void> onGetUserLocation() async {
    try {
      final location = await _geolocationRepository.getCurrentLocation();
      final updatedUserLocation = Map<String, double>.from(location);
      emit(state.copyWith(currentLocation: updatedUserLocation));
    } on PermissionDeniedException catch (exception) {
      emit(state.copyWith(errorMessage: exception.errorMessage));
    } on GeolocationException catch (exception) {
      emit(state.copyWith(errorMessage: exception.errorMessage));
    } finally {
      emit(state.copyWith(errorMessage: ''));
    }
  }

  void onTitleChanged(String title) {
    emit(state.copyWith(title: title));
  }

  void onDescriptionChanged(String description) {
    emit(state.copyWith(description: description));
  }

  void onPriceChanged(String priceText) {
    emit(state.copyWith(price: int.parse(priceText)));
  }

  void onCategoryChanged(String category) {
    emit(state.copyWith(category: category));
  }

  void onEditListing(ListingModel? listing) {
    if (listing != null) {
      emit(
        state.copyWith(
          photos: listing.photos,
          currentLocation: listing.location,
          title: listing.title,
          description: listing.description,
          price: listing.priceByHour,
          category: listing.category,
        ),
      );
    }
  }

  Future<void> onSaveListing(ListingModel? listing) async {
    print('Hello, listing');
    emit(state.copyWith(formStatus: FormStatus.loading));
    try {
      await _listingRepository.saveListing(
        state.currentLocation,
        state.photos,
        state.title,
        state.description,
        state.category,
        state.price,
        currentListing: listing,
      );
      emit(state.copyWith(formStatus: FormStatus.success));
    } on UserNotFoundException catch (exception) {
      emit(state.copyWith(errorMessage: exception.errorMessage));
    } finally {
      emit(state.copyWith(formStatus: FormStatus.initial));
    }
  }
}
