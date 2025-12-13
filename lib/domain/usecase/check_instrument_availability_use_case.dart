import 'package:marketplace_musical_instruments_app/domain/repository/booking_repository.dart';

class CheckInstrumentAvailabilityUseCase {
  final BookingRepository bookingRepository;

  CheckInstrumentAvailabilityUseCase(this.bookingRepository);

  Future<bool> isInstrumentAvailable(
    String listingId,
    DateTime startDate,
    DateTime endDate,
  ) async {
    final bookings = await bookingRepository.getBookingsByStartAndEndDate(
      listingId,
      startDate,
      endDate,
    );
    return bookings.isEmpty;
  }
}
