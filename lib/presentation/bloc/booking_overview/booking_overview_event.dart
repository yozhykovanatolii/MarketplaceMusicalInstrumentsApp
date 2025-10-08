sealed class BookingOverviewEvent {}

final class UserBookingsFetchEvent extends BookingOverviewEvent {}

final class UserBookingsRequestsFetchEvent extends BookingOverviewEvent {}

final class AuthorAcceptRequestEvent extends BookingOverviewEvent {
  final bool isAccepted;
  final String bookingId;

  AuthorAcceptRequestEvent(
    this.isAccepted,
    this.bookingId,
  );
}
