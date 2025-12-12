import 'package:marketplace_musical_instruments_app/data/model/listing_model.dart';
import 'package:marketplace_musical_instruments_app/domain/entity/listing_entity.dart';
import 'package:marketplace_musical_instruments_app/domain/entity/location_entity.dart';

class ListingMapper {
  static ListingEntity toEntity(ListingModel listingModel) {
    final locationInitial = LocationEntity.initial();
    return ListingEntity(
      id: listingModel.id,
      title: listingModel.title,
      description: listingModel.description,
      category: listingModel.category,
      priceByHour: listingModel.priceByHour,
      photos: listingModel.photos,
      averageRating: listingModel.averageRating,
      reviewerCount: listingModel.reviewerCount,
      location: LocationEntity(
        latitude: listingModel.location['latitude'] ?? locationInitial.latitude,
        longitude:
            listingModel.location['longitude'] ?? locationInitial.longitude,
      ),
      authorId: listingModel.authorId,
      authorFullName: listingModel.authorFullName,
      authorPhoneNumber: listingModel.authorPhoneNumber,
      authorAvatar: listingModel.authorAvatar,
    );
  }
}
