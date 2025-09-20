sealed class AddAndEditListingEvent {}

final class AddListingPhotoEvent extends AddAndEditListingEvent {}

final class DeleteListingPhotoEvent extends AddAndEditListingEvent {
  final String photoUrl;

  DeleteListingPhotoEvent(this.photoUrl);
}
