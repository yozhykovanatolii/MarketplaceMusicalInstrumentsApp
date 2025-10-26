class UserBookingsNotFound implements Exception {
  final String errorMessage;

  UserBookingsNotFound(this.errorMessage);
}
