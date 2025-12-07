import 'package:marketplace_musical_instruments_app/data/datasource/remote/firebase_auth/user_auth.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/firestore/listing_firestore.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/firestore/user_firestore.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/storage/supabase_storage.dart';
import 'package:marketplace_musical_instruments_app/data/model/listing_model.dart';
import 'package:marketplace_musical_instruments_app/data/service/camera_picker_service.dart';
import 'package:uuid/uuid.dart';

class ListingRepository {
  final SupabaseStorage supabaseStorage;
  final ListingFirestore listingFirestore;
  final UserAuth userAuth;
  final UserFirestore userFirestore;

  ListingRepository(
    this.supabaseStorage,
    this.listingFirestore,
    this.userAuth,
    this.userFirestore,
  );

  Future<String> getListingPhotoUrl() async {
    final imageFile = await CameraPickerService.pickImageFileFromGallery();
    final imageUrl = await supabaseStorage.saveImage(imageFile, 'uploads');
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
    final userId = userAuth.userId;
    final userModel = await userFirestore.getUserModelById(userId);
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
      authorAvatar: userModel.avatar,
      authorPhoneNumber: userModel.phoneNumber,
    );
    await listingFirestore.saveListingModel(listingModel);
  }

  Stream<List<ListingModel>> getUserListings() {
    final authorId = userAuth.userId;
    return listingFirestore.getUserListings(authorId);
  }

  Future<List<ListingModel>> getAllListingExceptUsers() async {
    final authorId = userAuth.userId;
    return await listingFirestore.getAllListingExceptUsers(authorId);
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
    return await listingFirestore.filterListings(
      categories,
      startPrice,
      endPrice,
      averageRating,
      userLat,
      userLng,
      radius,
    );
  }

  Future<List<ListingModel>> searchListings(String searchText) async {
    return await listingFirestore.searchListings(searchText);
  }

  Future<void> deleteAuthorListing(String listingId) async {
    await listingFirestore.deleteListing(listingId);
  }
}
