import 'package:marketplace_musical_instruments_app/core/state/button_status.dart';
import 'package:marketplace_musical_instruments_app/core/state/form_status.dart';
import 'package:marketplace_musical_instruments_app/core/validator/listing_validator.dart';
import 'package:marketplace_musical_instruments_app/domain/entity/location_entity.dart';

class SaveListingState {
  final List<String> photos;
  final LocationEntity currentLocation;
  final String title;
  final String description;
  final int price;
  final String category;
  final FormStatus formStatus;
  final String errorMessage;

  SaveListingState({
    required this.photos,
    required this.errorMessage,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.formStatus,
    required this.currentLocation,
  });

  factory SaveListingState.initial() {
    return SaveListingState(
      photos: [],
      currentLocation: LocationEntity.initial(),
      title: '',
      description: '',
      price: 0,
      category: 'Guitar',
      errorMessage: '',
      formStatus: FormStatus.initial,
    );
  }

  SaveListingState copyWith({
    List<String>? photos,
    LocationEntity? currentLocation,
    String? title,
    String? description,
    int? price,
    String? category,
    FormStatus? formStatus,
    String? errorMessage,
  }) {
    return SaveListingState(
      photos: photos ?? this.photos,
      currentLocation: currentLocation ?? this.currentLocation,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      category: category ?? this.category,
      formStatus: formStatus ?? this.formStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  String get titleCounterText => '${title.length}/50';
  String get descriptionCounterText => '${description.length}/9000';

  String? get titleError => ListingValidator.validateTitle(title);
  String? get descriptionError =>
      ListingValidator.validateDescription(description);
  String? get priceError =>
      ListingValidator.validateListingPrice(price.toString());

  ButtonStatus get buttonStatus {
    if (photos.isEmpty ||
        ListingValidator.validateListingPrice(price.toString()) != null ||
        ListingValidator.validateTitle(title) != null ||
        ListingValidator.validateDescription(description) != null) {
      return ButtonStatus.disabled;
    }
    return ButtonStatus.enabled;
  }
}
