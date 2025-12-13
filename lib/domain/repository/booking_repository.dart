import 'package:marketplace_musical_instruments_app/domain/entity/booking_entity.dart';
import 'package:marketplace_musical_instruments_app/domain/entity/listing_entity.dart';

abstract interface class BookingRepository {
  Future<void> createBooking(
    ListingEntity listing,
    DateTime startDate,
    DateTime endDate,
    int totalPrice,
  );
  Future<List<BookingEntity>> getBookingsByStartAndEndDate(
    String listingId,
    DateTime startDate,
    DateTime endDate,
  );
  Future<List<BookingEntity>> getAllUserBookings();
  Stream<List<BookingEntity>> getAllUserBookingRequests();
  Future<void> changeBookingStatus(String newStatus, String bookingId);
}
