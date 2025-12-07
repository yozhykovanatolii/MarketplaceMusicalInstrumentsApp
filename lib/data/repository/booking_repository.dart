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
  final BookingFirestore bookingFirestore;
  final UserAuth userAuth;
  final UserFirestore userFirestore;

  BookingRepository(
    this.bookingFirestore,
    this.userAuth,
    this.userFirestore,
  );

  Future<void> createBooking(
    ListingModel listingModel,
    DateTime startDate,
    DateTime endDate,
    int totalPrice,
  ) async {
    final renterId = userAuth.userId;
    final renter = await userFirestore.getUserModelById(renterId);
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
    await bookingFirestore.saveBooking(bookingModel);
  }

  Future<bool> checkIfInstrumentBooked(
    String listingId,
    DateTime startDate,
    DateTime endDate,
  ) async {
    return await bookingFirestore.checkIfInstrumentBooked(
      listingId,
      startDate,
      endDate,
    );
  }

  Future<List<BookingEntity>> getAllUserBookings() async {
    final renterId = userAuth.userId;
    final bookingModels = await bookingFirestore.getAllUserBookings(renterId);
    return bookingModels
        .map((bookingModel) => BookingMapper.toEntity(bookingModel))
        .toList();
  }

  Future<void> callDialer(String phoneNumber) async {
    await DialerService.openDialer(phoneNumber);
  }

  Stream<List<BookingEntity>> getAllUserBookingRequests() {
    final authorId = userAuth.userId;
    final bookingRequestsStream = bookingFirestore.getAllUserBookingRequests(
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
    await bookingFirestore.changeBookingStatus(newStatus, bookingId);
  }
}
