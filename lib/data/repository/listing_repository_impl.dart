import 'package:marketplace_musical_instruments_app/data/datasource/remote/firebase_auth/user_auth.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/firestore/listing_firestore.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/firestore/user_firestore.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/storage/supabase_storage.dart';
import 'package:marketplace_musical_instruments_app/data/mapper/listing_mapper.dart';
import 'package:marketplace_musical_instruments_app/data/model/listing_model.dart';
import 'package:marketplace_musical_instruments_app/data/service/camera_picker_service.dart';
import 'package:marketplace_musical_instruments_app/domain/entity/listing_entity.dart';
import 'package:marketplace_musical_instruments_app/domain/entity/location_entity.dart';
import 'package:marketplace_musical_instruments_app/domain/repository/listing_repository.dart';
import 'package:uuid/uuid.dart';

class ListingRepositoryImpl implements ListingRepository {
  final SupabaseStorage supabaseStorage;
  final ListingFirestore listingFirestore;
  final UserAuth userAuth;
  final UserFirestore userFirestore;

  ListingRepositoryImpl(
    this.supabaseStorage,
    this.listingFirestore,
    this.userAuth,
    this.userFirestore,
  );

  @override
  Future<String> getListingPhotoUrl() async {
    final imageFile = await CameraPickerService.pickImageFileFromGallery();
    final imageUrl = await supabaseStorage.saveImage(imageFile, 'uploads');
    return imageUrl;
  }

  @override
  Future<void> saveListing(
    LocationEntity location,
    List<String> photos,
    String title,
    String description,
    String category,
    int price, {
    ListingEntity? currentListing,
  }) async {
    final userId = userAuth.userId;
    final userModel = await userFirestore.getUserModelById(userId);
    ListingModel listingModel = ListingModel.initial();
    listingModel = listingModel.copyWith(
      id: currentListing?.id ?? const Uuid().v1(),
      location: {
        'latitude': location.latitude,
        'longitude': location.longitude,
      },
      photos: photos,
      averageRating: listingModel.averageRating,
      reviewerCount: listingModel.reviewerCount,
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

  @override
  Stream<List<ListingEntity>> getUserListings() {
    final authorId = userAuth.userId;
    return listingFirestore.getUserListings(authorId).map((listingsModel) {
      return listingsModel
          .map((listingModel) => ListingMapper.toEntity(listingModel))
          .toList();
    });
  }

  @override
  Future<List<ListingEntity>> filterListings(
    List<String> categories,
    int startPrice,
    int endPrice,
    int averageRating,
    double userLat,
    double userLng,
    int radius,
  ) async {
    final listingsModel = await listingFirestore.filterListings(
      categories,
      startPrice,
      endPrice,
      averageRating,
      userLat,
      userLng,
      radius,
    );
    return listingsModel
        .map((listingModel) => ListingMapper.toEntity(listingModel))
        .toList();
  }

  @override
  Future<List<ListingEntity>> searchListings(String searchText) async {
    final listingsModel = await listingFirestore.searchListings(searchText);
    return listingsModel
        .map((listingModel) => ListingMapper.toEntity(listingModel))
        .toList();
  }

  @override
  Future<void> deleteAuthorListing(String listingId) async {
    await listingFirestore.deleteListing(listingId);
  }
}
