import 'package:marketplace_musical_instruments_app/core/service/user_auth_service.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/firestore/booking_firestore.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/firestore/user_firestore.dart';
import 'package:marketplace_musical_instruments_app/data/model/booking_model.dart';
import 'package:marketplace_musical_instruments_app/data/model/listing_model.dart';
import 'package:marketplace_musical_instruments_app/domain/entity/booking_entity.dart';
import 'package:uuid/uuid.dart';

class BookingRepository {
  final _bookingFirestore = BookingFirestore();
  final _userFirestore = UserFirestore();

  Future<void> createBooking(
    ListingModel listingModel,
    DateTime startDate,
    DateTime endDate,
    int totalPrice,
  ) async {
    final renterId = UserAuthService.userId;
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
    final renterId = UserAuthService.userId;
    final bookingModels = await _bookingFirestore.getAllUserBookings(renterId);

    return bookingModels
        .map(
          (bookingModel) => BookingEntity(
            id: bookingModel.id,
            renterAvatar: bookingModel.renterAvatar,
            renterFullName: bookingModel.renterFullName,
            listingTitle: bookingModel.listingTitle,
            listingPhoto: bookingModel.listingPhoto,
            listingCategory: bookingModel.listingCategory,
            startDate:
                "${bookingModel.startDate.day.toString().padLeft(2, '0')}.${bookingModel.startDate.month.toString().padLeft(2, '0')}.${bookingModel.startDate.year}",
            endDate:
                "${bookingModel.endDate.day.toString().padLeft(2, '0')}.${bookingModel.endDate.month.toString().padLeft(2, '0')}.${bookingModel.endDate.year}",
            totalPrice: bookingModel.totalPrice,
            status: BookingStatus.fromText(bookingModel.status),
          ),
        )
        .toList();
  }

  Stream<List<BookingEntity>> getAllUserBookingRequests() {
    final authorId = UserAuthService.userId;
    final bookingRequestsStream = _bookingFirestore.getAllUserBookingRequests(
      authorId,
    );
    return bookingRequestsStream.map((bookingRequests) {
      return bookingRequests
          .map(
            (request) => BookingEntity(
              id: request.id,
              renterAvatar: request.renterAvatar,
              renterFullName: request.renterFullName,
              listingTitle: request.listingTitle,
              listingPhoto: request.listingPhoto,
              listingCategory: request.listingCategory,
              startDate:
                  "${request.startDate.day.toString().padLeft(2, '0')}.${request.startDate.month.toString().padLeft(2, '0')}.${request.startDate.year}",
              endDate:
                  "${request.endDate.day.toString().padLeft(2, '0')}.${request.endDate.month.toString().padLeft(2, '0')}.${request.endDate.year}",
              totalPrice: request.totalPrice,
              status: BookingStatus.fromText(request.status),
            ),
          )
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
