enum ButtonStatus { enabled, disabled }

class AddAndEditListingState {
  final List<String> photos;
  final Map<String, double> currentLocation;
  final String title;
  final String description;
  final int price;
  final String? titleError;
  final String? descriptionError;
  final String? priceError;
  final String errorMessage;

  AddAndEditListingState({
    required this.photos,
    required this.errorMessage,
    required this.title,
    required this.description,
    required this.price,
    this.titleError,
    this.descriptionError,
    this.priceError,
    required this.currentLocation,
  });

  factory AddAndEditListingState.initial() {
    return AddAndEditListingState(
      photos: [],
      currentLocation: {},
      title: '',
      description: '',
      price: 0,
      errorMessage: '',
    );
  }

  AddAndEditListingState copyWith({
    List<String>? photos,
    Map<String, double>? currentLocation,
    String? title,
    String? description,
    int? price,
    String? errorMessage,
    String? titleError,
    String? descriptionError,
    String? priceError,
    bool clearTitleError = false,
    bool clearDecriptionError = false,
    bool clearPriceError = false,
  }) {
    return AddAndEditListingState(
      photos: photos ?? this.photos,
      currentLocation: currentLocation ?? this.currentLocation,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
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
