import 'package:marketplace_musical_instruments_app/data/datasource/remote/firebase_auth/user_auth.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/firestore/booking_firestore.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/firestore/user_firestore.dart';
import 'package:marketplace_musical_instruments_app/data/mapper/booking_mapper.dart';
import 'package:marketplace_musical_instruments_app/data/model/booking_model.dart';
import 'package:marketplace_musical_instruments_app/domain/entity/booking_entity.dart';
import 'package:marketplace_musical_instruments_app/domain/entity/listing_entity.dart';
import 'package:marketplace_musical_instruments_app/domain/repository/booking_repository.dart';
import 'package:uuid/uuid.dart';

class BookingRepositoryImpl implements BookingRepository {
  final BookingFirestore bookingFirestore;
  final UserAuth userAuth;
  final UserFirestore userFirestore;

  BookingRepositoryImpl(
    this.bookingFirestore,
    this.userAuth,
    this.userFirestore,
  );

  @override
  Future<void> createBooking(
    ListingEntity listing,
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
      authorId: listing.authorId,
      listingId: listing.id,
      listingTitle: listing.title,
      listingPhoto: listing.photos.first,
      listingCategory: listing.category,
      startDate: startDate,
      endDate: endDate,
      totalPrice: totalPrice,
    );
    await bookingFirestore.saveBooking(bookingModel);
  }

  @override
  Future<List<BookingEntity>> getBookingsByStartAndEndDate(
    String listingId,
    DateTime startDate,
    DateTime endDate,
  ) async {
    final bookingsModel = await bookingFirestore.getBookingsByStartAndEndDate(
      listingId,
      startDate,
      endDate,
    );
    return bookingsModel
        .map((bookingModel) => BookingMapper.toEntity(bookingModel))
        .toList();
  }

  @override
  Future<List<BookingEntity>> getAllUserBookings() async {
    final renterId = userAuth.userId;
    final bookingModels = await bookingFirestore.getAllUserBookings(renterId);
    return bookingModels
        .map((bookingModel) => BookingMapper.toEntity(bookingModel))
        .toList();
  }

  @override
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

  @override
  Future<void> changeBookingStatus(
    String newStatus,
    String bookingId,
  ) async {
    await bookingFirestore.changeBookingStatus(newStatus, bookingId);
  }
}
