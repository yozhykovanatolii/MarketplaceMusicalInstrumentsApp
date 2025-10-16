import 'package:marketplace_musical_instruments_app/data/datasource/local/camera/camera_picker.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/listing/listing_firestore.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/listing/listing_storage.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/user/user_auth.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/user/user_firestore.dart';
import 'package:marketplace_musical_instruments_app/data/model/listing_model.dart';
import 'package:uuid/uuid.dart';

class ListingRepository {
  final _cameraPicker = CameraPicker();
  final _listingStorage = ListingStorage();
  final _listingFirestore = ListingFirestore();
  final _userAuth = UserAuth();
  final _userFirestore = UserFirestore();

  Future<String> getListingPhotoUrl() async {
    final imageFile = await _cameraPicker.pickImageFileFromGallery();
    final imageUrl = await _listingStorage.saveListingImage(imageFile);
    return imageUrl;
  }

  Future<void> saveListing(
    Map<String, double> location,
    List<String> photos,
    String title,
    String description,
    String category,
    int price, {
    ListingModel? currentListing,
  }) async {
    final userId = _userAuth.userId;
    final userModel = await _userFirestore.getUserModelById(userId);
    ListingModel listingModel = currentListing ?? ListingModel.initial();
    listingModel = listingModel.copyWith(
      id: currentListing?.id ?? const Uuid().v1(),
      location: location,
      photos: photos,
      averageRating: listingModel.averageRating,
      reviewerCount: listingModel.reviewerCount,
      reviews: listingModel.reviews,
      title: title,
      description: description,
      priceByHour: price,
      category: category,
      authorId: userId,
      authorFullName: userModel.fullName,
    );
    await _listingFirestore.saveListingModel(listingModel);
  }

  Stream<List<ListingModel>> getUserListings() {
    final authorId = _userAuth.userId;
    return _listingFirestore.getUserListings(authorId);
  }

  Future<List<ListingModel>> getAllListingExceptUsers() async {
    final authorId = _userAuth.userId;
    return await _listingFirestore.getAllListingExceptUsers(authorId);
  }

  Future<List<ListingModel>> filterListings(
    List<String> categories,
    int startPrice,
    int endPrice,
    int averageRating,
  ) async {
    return await _listingFirestore.filterListings(
      categories,
      startPrice,
      endPrice,
      averageRating,
    );
  }

  Future<List<ListingModel>> searchListings(String searchText) async {
    return await _listingFirestore.searchListings(searchText);
  }

  Future<void> deleteAuthorListing(String listingId) async {
    await _listingFirestore.deleteListing(listingId);
  }
}
