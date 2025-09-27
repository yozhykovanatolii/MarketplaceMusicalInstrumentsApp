import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marketplace_musical_instruments_app/data/model/listing_model.dart';

class ListingFirestore {
  final _firestore = FirebaseFirestore.instance;

  Future<void> saveListingModel(ListingModel listingModel) async {
    final docReference = getListingDocumentReference(listingModel.id);
    await docReference.set(listingModel);
  }

  Future<List<ListingModel>> getUserListings(String userId) async {
    final query = _firestore
        .collection('listings')
        .where('authorId', isEqualTo: userId)
        .withConverter(
          fromFirestore: ListingModel.fromFirestore,
          toFirestore: (ListingModel listingModel, options) =>
              listingModel.toFirestore(),
        );
    final querySnapshot = await query.get();
    if (querySnapshot.docs.isEmpty) {
      throw Exception('User listings weren\'t found');
    }
    return querySnapshot.docs.map((document) => document.data()).toList();
  }

  Future<void> deleteListing(String listingId) async {
    await _firestore.collection('listings').doc(listingId).delete();
  }

  DocumentReference<ListingModel> getListingDocumentReference(String id) {
    return _firestore
        .collection('listings')
        .doc(id)
        .withConverter(
          fromFirestore: ListingModel.fromFirestore,
          toFirestore: (ListingModel userModel, options) =>
              userModel.toFirestore(),
        );
  }
}
