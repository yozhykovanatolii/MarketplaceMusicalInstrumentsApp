import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marketplace_musical_instruments_app/data/model/booking_model.dart';

class BookingFirestore {
  final _firestore = FirebaseFirestore.instance;

  Future<void> saveBooking(BookingModel bookingModel) async {
    final docReference = getBookingDocumentReference(bookingModel.id);
    await docReference.set(bookingModel);
  }

  Future<List<BookingModel>> getAllUserBookings(String userId) async {
    final query = _firestore
        .collection('bookings')
        .where('renterId', isEqualTo: userId)
        .withConverter(
          fromFirestore: BookingModel.fromFirestore,
          toFirestore: (BookingModel bookingModel, options) =>
              bookingModel.toFirestore(),
        );
    final querySnapshot = await query.get();
    if (querySnapshot.docs.isEmpty) {
      throw Exception('Bookings weren\'t found');
    }
    return querySnapshot.docs.map((document) => document.data()).toList();
  }

  Future<bool> checkIfInstrumentBooked(
    String listingId,
    DateTime startDate,
    DateTime endDate,
  ) async {
    final querySnapshot = await _firestore
        .collection('bookings')
        .where('listingId', isEqualTo: listingId)
        .where('startDate', isEqualTo: Timestamp.fromDate(startDate))
        .where('endDate', isEqualTo: Timestamp.fromDate(endDate))
        .limit(1)
        .get();
    return querySnapshot.docs.isNotEmpty;
  }

  DocumentReference<BookingModel> getBookingDocumentReference(String id) {
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
