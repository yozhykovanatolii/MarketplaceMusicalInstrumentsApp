class BookingRequestsNotFound implements Exception {
  final String errorMessage;

  BookingRequestsNotFound(this.errorMessage);
}
