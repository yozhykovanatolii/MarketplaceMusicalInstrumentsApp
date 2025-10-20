import 'package:marketplace_musical_instruments_app/data/datasource/remote/booking/booking_firestore.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/user/user_auth.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/user/user_firestore.dart';
import 'package:marketplace_musical_instruments_app/data/model/booking_model.dart';
import 'package:marketplace_musical_instruments_app/data/model/listing_model.dart';
import 'package:uuid/uuid.dart';

class BookingRepository {
  final _bookingFirestore = BookingFirestore();
  final _userAuth = UserAuth();
  final _userFirestore = UserFirestore();

  Future<void> createBooking(
    ListingModel listingModel,
    DateTime startDate,
    DateTime endDate,
    int totalPrice,
  ) async {
    final renterId = _userAuth.userId;
    final renter = await _userFirestore.getUserModelById(renterId);
    BookingModel bookingModel = BookingModel.initial();
    bookingModel = bookingModel.copyWith(
      id: const Uuid().v1(),
      renterId: renterId,
      renterFullName: renter.fullName,
      renterAvatar: renter.avatar,
      authorId: listingModel.authorId,
      listingId: listingModel.id,
      listingTitle: listingModel.title,
      listingPhoto: listingModel.photos.first,
      listingCategory: listingModel.category,
      startDate: startDate,
      endDate: endDate,
      totalPrice: totalPrice,
    );
    await _bookingFirestore.saveBooking(bookingModel);
  }

  Future<bool> checkIfInstrumentBooked(
    String listingId,
    DateTime startDate,
    DateTime endDate,
  ) async {
    return await _bookingFirestore.checkIfInstrumentBooked(
      listingId,
      startDate,
      endDate,
    );
  }

  Future<List<BookingModel>> getAllUserBookings() async {
    final renterId = _userAuth.userId;
    return await _bookingFirestore.getAllUserBookings(renterId);
  }

  Stream<List<BookingModel>> getAllUserBookingRequests() {
    final authorId = _userAuth.userId;
    return _bookingFirestore.getAllUserBookingRequests(authorId);
  }

  Future<void> changeBookingStatus(
    String newStatus,
    String bookingId,
  ) async {
    await _bookingFirestore.changeBookingStatus(newStatus, bookingId);
  }
}
