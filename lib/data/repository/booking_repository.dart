import 'package:marketplace_musical_instruments_app/data/datasource/remote/firebase_auth/user_auth.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/firestore/booking_firestore.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/firestore/user_firestore.dart';
import 'package:marketplace_musical_instruments_app/data/mapper/booking_mapper.dart';
import 'package:marketplace_musical_instruments_app/data/model/booking_model.dart';
import 'package:marketplace_musical_instruments_app/data/model/listing_model.dart';
import 'package:marketplace_musical_instruments_app/data/service/dialer_service.dart';
import 'package:marketplace_musical_instruments_app/domain/entity/booking_entity.dart';
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

  Future<List<BookingEntity>> getAllUserBookings() async {
    final renterId = _userAuth.userId;
    final bookingModels = await _bookingFirestore.getAllUserBookings(renterId);
    return bookingModels
        .map((bookingModel) => BookingMapper.toEntity(bookingModel))
        .toList();
  }

  Future<void> callDialer(String phoneNumber) async {
    await DialerService.openDialer(phoneNumber);
  }

  Stream<List<BookingEntity>> getAllUserBookingRequests() {
    final authorId = _userAuth.userId;
    final bookingRequestsStream = _bookingFirestore.getAllUserBookingRequests(
      authorId,
    );
    return bookingRequestsStream.map((bookingRequests) {
      return bookingRequests
          .map((request) => BookingMapper.toEntity(request))
          .toList();
    });
  }

  Future<void> changeBookingStatus(
    String newStatus,
    String bookingId,
  ) async {
    await _bookingFirestore.changeBookingStatus(newStatus, bookingId);
  }
}
