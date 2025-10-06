import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marketplace_musical_instruments_app/data/model/booking_model.dart';

class BookingFirestore {
  final _firestore = FirebaseFirestore.instance;

  Future<void> saveBooking(BookingModel bookingModel) async {
    final docReference = getUserDocumentReference(bookingModel.id);
    await docReference.set(bookingModel);
  }

  DocumentReference<BookingModel> getUserDocumentReference(String id) {
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
