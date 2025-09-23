import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/exception/geolocation_exception.dart';
import 'package:marketplace_musical_instruments_app/core/exception/permission_denied_exception.dart';
import 'package:marketplace_musical_instruments_app/core/exception/photo_not_selected_exception.dart';
import 'package:marketplace_musical_instruments_app/core/service/geolocation_service.dart';
import 'package:marketplace_musical_instruments_app/core/util/listing_validator_util.dart';
import 'package:marketplace_musical_instruments_app/data/repository/listing_repository.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/add_and_edit_listing/add_and_edit_listing_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/add_and_edit_listing/add_and_edit_listing_state.dart';

class AddAndEditListingBloc
    extends Bloc<AddAndEditListingEvent, AddAndEditListingState> {
  final _listingRepository = ListingRepository();

  AddAndEditListingBloc() : super(AddAndEditListingState.initial()) {
    on<AddListingPhotoEvent>(_onAddListingPhotoInList);
    on<DeleteListingPhotoEvent>(_onDeleteListingPhotoFromList);
    on<GetUserCurrentLocationEvent>(_onGetUserLocation);
    on<ListingTitleChangeEvent>(_onTitleChanged);
    on<ListingDecriptionChangeEvent>(_onDescriptionChanged);
    on<ListingPriceChangeEvent>(_onPriceChanged);
  }

  Future<void> _onAddListingPhotoInList(
    AddListingPhotoEvent event,
    Emitter<AddAndEditListingState> emit,
  ) async {
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

  void _onDeleteListingPhotoFromList(
    DeleteListingPhotoEvent event,
    Emitter<AddAndEditListingState> emit,
  ) {
    String photoUrl = event.photoUrl;
    final updatedList = List<String>.from(state.photos)..remove(photoUrl);
    emit(state.copyWith(photos: updatedList));
  }

  Future<void> _onGetUserLocation(
    GetUserCurrentLocationEvent event,
    Emitter<AddAndEditListingState> emit,
  ) async {
    try {
      final location = await GeolocationService.getCurrentLocation();
      final updatedUserLocation = Map<String, double>.from(
        state.currentLocation,
      );
      updatedUserLocation.addAll({
        'latitude': location.latitude,
        'longitude': location.longitude,
      });
      emit(state.copyWith(currentLocation: updatedUserLocation));
    } on PermissionDeniedException catch (exception) {
      emit(state.copyWith(errorMessage: exception.errorMessage));
    } on GeolocationException catch (exception) {
      emit(state.copyWith(errorMessage: exception.errorMessage));
    } finally {
      emit(state.copyWith(errorMessage: ''));
    }
  }

  void _onTitleChanged(
    ListingTitleChangeEvent event,
    Emitter<AddAndEditListingState> emit,
  ) {
    final title = event.title;
    final titleError = ListingValidatorUtil.validateTitle(title);
    emit(
      state.copyWith(
        title: title,
        titleError: titleError,
        clearTitleError: titleError == null,
      ),
    );
  }

  void _onDescriptionChanged(
    ListingDecriptionChangeEvent event,
    Emitter<AddAndEditListingState> emit,
  ) {
    final description = event.description;
    final descriptionError = ListingValidatorUtil.validateDescription(
      description,
    );
    emit(
      state.copyWith(
        description: description,
        descriptionError: descriptionError,
        clearDecriptionError: descriptionError == null,
      ),
    );
  }

  void _onPriceChanged(
    ListingPriceChangeEvent event,
    Emitter<AddAndEditListingState> emit,
  ) {
    final priceText = event.priceText;
    final priceError = ListingValidatorUtil.validateListingPrice(priceText);
    emit(
      state.copyWith(
        price: priceError == null ? int.parse(priceText) : 0,
        priceError: priceError,
        clearPriceError: priceError == null,
      ),
    );
  }
}
