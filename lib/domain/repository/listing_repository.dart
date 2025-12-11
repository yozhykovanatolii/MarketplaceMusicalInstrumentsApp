import 'package:marketplace_musical_instruments_app/data/model/listing_model.dart';

abstract interface class ListingRepository {
  Future<String> getListingPhotoUrl();
  Future<void> saveListing(
    Map<String, double> location,
    List<String> photos,
    String title,
    String description,
    String category,
    int price, {
    ListingModel? currentListing,
  });
  Stream<List<ListingModel>> getUserListings();
  Future<List<ListingModel>> getAllListingExceptUsers();
  Future<List<ListingModel>> filterListings(
    List<String> categories,
    int startPrice,
    int endPrice,
    int averageRating,
    double userLat,
    double userLng,
    int radius,
  );
  Future<List<ListingModel>> searchListings(String searchText);
  Future<void> deleteAuthorListing(String listingId);
}
