import 'package:marketplace_musical_instruments_app/data/model/listing_model.dart';
import 'package:marketplace_musical_instruments_app/domain/entity/booking_entity.dart';

abstract interface class BookingRepository {
  Future<void> createBooking(
    ListingModel listingModel,
    DateTime startDate,
    DateTime endDate,
    int totalPrice,
  );
  Future<bool> checkIfInstrumentBooked(
    String listingId,
    DateTime startDate,
    DateTime endDate,
  );
  Future<List<BookingEntity>> getAllUserBookings();
  Stream<List<BookingEntity>> getAllUserBookingRequests();
  Future<void> changeBookingStatus(String newStatus, String bookingId);
}
