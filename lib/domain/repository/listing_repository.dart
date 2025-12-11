import 'package:marketplace_musical_instruments_app/domain/entity/listing_entity.dart';
import 'package:marketplace_musical_instruments_app/domain/entity/location_entity.dart';

abstract interface class ListingRepository {
  Future<String> getListingPhotoUrl();
  Future<void> saveListing(
    LocationEntity location,
    List<String> photos,
    String title,
    String description,
    String category,
    int price, {
    ListingEntity? currentListing,
  });
  Stream<List<ListingEntity>> getUserListings();
  Future<List<ListingEntity>> filterListings(
    List<String> categories,
    int startPrice,
    int endPrice,
    int averageRating,
    double userLat,
    double userLng,
    int radius,
  );
  Future<List<ListingEntity>> searchListings(String searchText);
  Future<void> deleteAuthorListing(String listingId);
}
