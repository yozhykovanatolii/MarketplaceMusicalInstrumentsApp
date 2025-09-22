class AddAndEditListingState {
  final List<String> photos;
  final Map<String, double> currentLocation;
  final String errorMessage;

  AddAndEditListingState({
    required this.photos,
    required this.errorMessage,
    required this.currentLocation,
  });

  factory AddAndEditListingState.initial() {
    return AddAndEditListingState(
      photos: [],
      currentLocation: {},
      errorMessage: '',
    );
  }

  AddAndEditListingState copyWith({
    List<String>? photos,
    Map<String, double>? currentLocation,
    String? errorMessage,
  }) {
    return AddAndEditListingState(
      photos: photos ?? this.photos,
      currentLocation: currentLocation ?? this.currentLocation,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
