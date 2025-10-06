sealed class BookingSaveEvent {}

final class BookingTotalCalculateEvent extends BookingSaveEvent {
  final DateTime? startDate;
  final DateTime? endDate;
  final int startingPrice;

  BookingTotalCalculateEvent(
    this.startDate,
    this.endDate,
    this.startingPrice,
  );
}

final class BookingCreateEvent extends BookingSaveEvent {}
