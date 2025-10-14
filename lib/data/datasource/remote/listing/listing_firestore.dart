import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marketplace_musical_instruments_app/data/model/listing_model.dart';

class ListingFirestore {
  final _firestore = FirebaseFirestore.instance;

  Future<void> saveListingModel(ListingModel listingModel) async {
    final docReference = getListingDocumentReference(listingModel.id);
    await docReference.set(listingModel);
  }

  Future<Map<String, dynamic>> getListingRatingAndReviewerCount(
    String listingId,
  ) async {
    final docReference = getListingDocumentReference(listingId);
    final docSnapshot = await docReference.get();
    if (!docSnapshot.exists) return {};
    final listingModel = docSnapshot.data();
    return {
      'averageRating': listingModel?.averageRating ?? 0,
      'reviewerCount': listingModel?.reviewerCount ?? 0,
    };
  }

  Stream<List<ListingModel>> getUserListings(String userId) {
    return _firestore
        .collection('listings')
        .where('authorId', isEqualTo: userId)
        .withConverter(
          fromFirestore: ListingModel.fromFirestore,
          toFirestore: (ListingModel userModel, options) =>
              userModel.toFirestore(),
        )
        .snapshots()
        .map((snapshot) {
          if (snapshot.docs.isEmpty) {
            throw Exception('User listings weren\'t found');
          }
          return snapshot.docs.map((document) => document.data()).toList();
        });
  }

  Future<List<ListingModel>> getAllListingExceptUsers(String userId) async {
    final query = _firestore
        .collection('listings')
        .where('authorId', isEqualTo: userId)
        .withConverter(
          fromFirestore: ListingModel.fromFirestore,
          toFirestore: (ListingModel userModel, options) =>
              userModel.toFirestore(),
        );
    final querySnapshot = await query.get();
    if (querySnapshot.docs.isEmpty) {
      throw Exception('Listings weren\'t found');
    }
    return querySnapshot.docs.map((document) => document.data()).toList();
  }

  Future<List<ListingModel>> filterListings(
    List<String> categories,
    int startPrice,
    int endPrice,
  ) async {
    var query = _firestore
        .collection('listings')
        .where('priceByHour', isGreaterThanOrEqualTo: startPrice)
        .where('priceByHour', isLessThanOrEqualTo: endPrice)
        .withConverter(
          fromFirestore: ListingModel.fromFirestore,
          toFirestore: (ListingModel userModel, options) =>
              userModel.toFirestore(),
        );
    if (categories.isNotEmpty) {
      query = query.where('category', whereIn: categories);
    }
    final querySnapshot = await query.get();
    if (querySnapshot.docs.isEmpty) {
      throw Exception(
        'Listings weren\'t found matching the selected criteria',
      );
    }
    return querySnapshot.docs.map((document) => document.data()).toList();
  }

  Future<List<ListingModel>> searchListings(String searchText) async {
    final titleQuery = _firestore
        .collection('listings')
        .orderBy('title')
        .startAt([searchText])
        .endAt(['$searchText\uf8ff'])
        .withConverter(
          fromFirestore: ListingModel.fromFirestore,
          toFirestore: (ListingModel userModel, options) =>
              userModel.toFirestore(),
        )
        .get();
    final categoryQuery = _firestore
        .collection('listings')
        .orderBy('category')
        .startAt([searchText])
        .endAt(['$searchText\uf8ff'])
        .withConverter(
          fromFirestore: ListingModel.fromFirestore,
          toFirestore: (ListingModel userModel, options) =>
              userModel.toFirestore(),
        )
        .get();
    final results = await Future.wait([titleQuery, categoryQuery]);
    final allDocs = results.expand((s) => s.docs).toList();
    if (allDocs.isEmpty) throw Exception('Listings weren\'t found');
    final Map<String, ListingModel> uniqueListings = {};
    for (var doc in allDocs) {
      uniqueListings[doc.id] = doc.data();
    }
    return uniqueListings.values.toList();
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
