import 'package:marketplace_musical_instruments_app/data/datasource/remote/booking/booking_firestore.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/user/user_auth.dart';
import 'package:marketplace_musical_instruments_app/data/model/booking_model.dart';
import 'package:marketplace_musical_instruments_app/data/model/listing_model.dart';
import 'package:uuid/uuid.dart';

class BookingRepository {
  final _bookingFirestore = BookingFirestore();
  final _userAuth = UserAuth();

  Future<void> createBooking(
    ListingModel listingModel,
    DateTime startDate,
    DateTime endDate,
    int totalPrice,
  ) async {
    final renterId = _userAuth.userId;
    BookingModel bookingModel = BookingModel.initial();
    bookingModel = bookingModel.copyWith(
      id: const Uuid().v1(),
      renterId: renterId,
      authorId: listingModel.authorId,
      listingId: listingModel.id,
      startDate: startDate,
      endDate: endDate,
      totalPrice: totalPrice,
    );
    await _bookingFirestore.saveBooking(bookingModel);
  }
}
