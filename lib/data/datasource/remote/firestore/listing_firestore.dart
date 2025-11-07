import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marketplace_musical_instruments_app/core/exception/listing/favourite_listings_exception.dart';
import 'package:marketplace_musical_instruments_app/core/exception/listing/get_all_listings_except_user_exception.dart';
import 'package:marketplace_musical_instruments_app/core/exception/listing/listing_filtration_exception.dart';
import 'package:marketplace_musical_instruments_app/core/exception/listing/listing_searching_exception.dart';
import 'package:marketplace_musical_instruments_app/core/exception/listing/user_listings_exception.dart';
import 'package:marketplace_musical_instruments_app/core/service/geolocation_service.dart';
import 'package:marketplace_musical_instruments_app/data/model/listing_model.dart';

class ListingFirestore {
  final _firestore = FirebaseFirestore.instance;

  Future<void> saveListingModel(ListingModel listingModel) async {
    final docReference = getListingDocumentReference(listingModel.id);
    await docReference.set(listingModel);
  }

  Stream<List<ListingModel>> getUserFavouriteListings(
    List<String> favouriteListingsId,
  ) {
    if (favouriteListingsId.isEmpty) {
      throw FavouriteListingsException(
        'You don\'t have favourite listings',
      );
    }
    return _firestore
        .collection('listings')
        .where('id', whereIn: favouriteListingsId)
        .withConverter(
          fromFirestore: ListingModel.fromFirestore,
          toFirestore: (ListingModel userModel, options) =>
              userModel.toFirestore(),
        )
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((document) => document.data()).toList();
        });
  }

  Stream<Map<String, dynamic>> getListingRatingAndReviewerCount(
    String listingId,
  ) {
    final docReference = getListingDocumentReference(listingId);
    return docReference.snapshots().map((snapshot) {
      if (!snapshot.exists) return {};
      final listingModel = snapshot.data();
      return {
        'averageRating': listingModel?.averageRating ?? 0,
        'reviewerCount': listingModel?.reviewerCount ?? 0,
      };
    });
  }

  Future<void> updateListingAverageRatingAndCounter(
    String listingId,
    double newAverageRating,
    int newReviewerCounter,
  ) async {
    final docReference = getListingDocumentReference(listingId);
    await docReference.update({
      'averageRating': newAverageRating,
      'reviewerCount': newReviewerCounter,
    });
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
            throw UserListingsException('User listings weren\'t found');
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
      throw GetAllListingsExceptUserException('Listings weren\'t found');
    }
    return querySnapshot.docs.map((document) => document.data()).toList();
  }

  Future<List<ListingModel>> filterListings(
    List<String> categories,
    int startPrice,
    int endPrice,
    int averageRating,
    double userLat,
    double userLng,
    int radius,
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
    if (averageRating != 0) {
      query = query.where(
        'averageRating',
        isGreaterThanOrEqualTo: averageRating,
      );
    }
    final querySnapshot = await query.get();
    if (querySnapshot.docs.isEmpty) {
      throw ListingFiltrationException(
        'Listings weren\'t found matching the selected criteria',
      );
    }
    final listings = querySnapshot.docs
        .map((document) => document.data())
        .toList();
    final nearbyListings = listings.where((listing) {
      final location = listing.location;
      return GeolocationService.isListingExistInThisRadius(
        radius,
        userLat,
        userLng,
        location['latitude']!,
        location['longitude']!,
      );
    }).toList();
    if (nearbyListings.isEmpty) {
      throw ListingFiltrationException(
        'No listings found nearby',
      );
    }
    return nearbyListings;
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
    if (allDocs.isEmpty) {
      throw ListingSearchingException('Listings weren\'t found');
    }
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
