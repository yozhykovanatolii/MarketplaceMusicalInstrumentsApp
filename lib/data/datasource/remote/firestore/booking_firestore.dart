import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marketplace_musical_instruments_app/core/exception/booking/booking_requests_not_found.dart';
import 'package:marketplace_musical_instruments_app/core/exception/booking/user_bookings_not_found.dart';
import 'package:marketplace_musical_instruments_app/data/model/booking_model.dart';

class BookingFirestore {
  final _firestore = FirebaseFirestore.instance;

  Future<void> saveBooking(BookingModel bookingModel) async {
    final docReference = _getBookingDocumentReference(bookingModel.id);
    await docReference.set(bookingModel);
  }

  Future<void> changeBookingStatus(String newStatus, String bookingId) async {
    final docReference = _getBookingDocumentReference(bookingId);
    await docReference.update({'status': newStatus});
  }

  Future<List<BookingModel>> getAllUserBookings(String userId) async {
    final collectionReference = _getBookingCollectionReference();
    final query = collectionReference.where('renterId', isEqualTo: userId);
    final querySnapshot = await query.get();
    if (querySnapshot.docs.isEmpty) {
      throw UserBookingsNotFound('Bookings weren\'t found');
    }
    return querySnapshot.docs.map((document) => document.data()).toList();
  }

  Stream<List<BookingModel>> getAllUserBookingRequests(String authorId) {
    final collectionReference = _getBookingCollectionReference();
    return collectionReference
        .where('authorId', isEqualTo: authorId)
        .where('status', isEqualTo: 'Unconfirmed')
        .snapshots()
        .map((snapshot) {
          if (snapshot.docs.isEmpty) {
            throw BookingRequestsNotFound('There are no requests yet');
          }
          return snapshot.docs.map((document) => document.data()).toList();
        });
  }

  Future<List<BookingModel>> getBookingsByStartAndEndDate(
    String listingId,
    DateTime startDate,
    DateTime endDate,
  ) async {
    final collectionReference = _getBookingCollectionReference();
    final querySnapshot = await collectionReference
        .where('listingId', isEqualTo: listingId)
        .where('startDate', isEqualTo: Timestamp.fromDate(startDate))
        .where('endDate', isEqualTo: Timestamp.fromDate(endDate))
        .limit(1)
        .get();
    return querySnapshot.docs.map((document) => document.data()).toList();
  }

  CollectionReference<BookingModel> _getBookingCollectionReference() {
    return _firestore
        .collection('bookings')
        .withConverter(
          fromFirestore: BookingModel.fromFirestore,
          toFirestore: (BookingModel userModel, options) =>
              userModel.toFirestore(),
        );
  }

  DocumentReference<BookingModel> _getBookingDocumentReference(String id) {
    return _firestore
        .collection('bookings')
        .doc(id)
        .withConverter(
          fromFirestore: BookingModel.fromFirestore,
          toFirestore: (BookingModel bookingModel, options) =>
              bookingModel.toFirestore(),
        );
  }
}
