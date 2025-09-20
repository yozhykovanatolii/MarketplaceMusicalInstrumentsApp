class AddAndEditListingState {
  final List<String> photos;
  final String errorMessage;

  AddAndEditListingState({
    required this.photos,
    required this.errorMessage,
  });

  factory AddAndEditListingState.initial() {
    return AddAndEditListingState(
      photos: [],
      errorMessage: '',
    );
  }

  AddAndEditListingState copyWith({
    List<String>? photos,
    String? errorMessage,
  }) {
    return AddAndEditListingState(
      photos: photos ?? this.photos,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
