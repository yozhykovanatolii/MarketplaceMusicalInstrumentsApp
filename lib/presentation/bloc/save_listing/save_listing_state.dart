import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_state.dart';

enum ButtonStatus { enabled, disabled }

class SaveListingState {
  final List<String> photos;
  final Map<String, double> currentLocation;
  final String title;
  final String description;
  final int price;
  final String category;
  final String? titleError;
  final String? descriptionError;
  final String? priceError;
  final FormStatus formStatus;
  final String errorMessage;

  SaveListingState({
    required this.photos,
    required this.errorMessage,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    this.titleError,
    this.descriptionError,
    this.priceError,
    required this.formStatus,
    required this.currentLocation,
  });

  factory SaveListingState.initial() {
    return SaveListingState(
      photos: [],
      currentLocation: {},
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
    Map<String, double>? currentLocation,
    String? title,
    String? description,
    int? price,
    String? category,
    String? errorMessage,
    String? titleError,
    String? descriptionError,
    String? priceError,
    FormStatus? formStatus,
    bool clearTitleError = false,
    bool clearDecriptionError = false,
    bool clearPriceError = false,
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
      titleError: clearTitleError ? null : (titleError ?? this.titleError),
      priceError: clearPriceError ? null : (priceError ?? this.priceError),
      descriptionError: clearDecriptionError
          ? null
          : (descriptionError ?? this.descriptionError),
    );
  }

  String get titleCounterText => '${title.length}/50';
  String get descriptionCounterText => '${description.length}/9000';

  ButtonStatus get buttonStatus {
    if (photos.isEmpty ||
        currentLocation.isEmpty ||
        price == 0 ||
        (title.length > 50 || titleError != null) ||
        (description.length > 50 || descriptionError != null)) {
      return ButtonStatus.disabled;
    }
    return ButtonStatus.enabled;
  }
}
