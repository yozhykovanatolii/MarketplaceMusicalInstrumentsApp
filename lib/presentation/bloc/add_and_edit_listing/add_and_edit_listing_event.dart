import 'package:marketplace_musical_instruments_app/data/model/listing_model.dart';

sealed class AddAndEditListingEvent {}

final class AddListingPhotoEvent extends AddAndEditListingEvent {}

final class DeleteListingPhotoEvent extends AddAndEditListingEvent {
  final String photoUrl;

  DeleteListingPhotoEvent(this.photoUrl);
}

final class GetUserCurrentLocationEvent extends AddAndEditListingEvent {}

final class ListingTitleChangeEvent extends AddAndEditListingEvent {
  final String title;

  ListingTitleChangeEvent(this.title);
}

final class ListingDecriptionChangeEvent extends AddAndEditListingEvent {
  final String description;

  ListingDecriptionChangeEvent(this.description);
}

final class ListingPriceChangeEvent extends AddAndEditListingEvent {
  final String priceText;

  ListingPriceChangeEvent(this.priceText);
}

final class ListingCategoryChangeEvent extends AddAndEditListingEvent {
  final String category;

  ListingCategoryChangeEvent(this.category);
}

final class ListingEditEvent extends AddAndEditListingEvent {
  final ListingModel? listing;

  ListingEditEvent(this.listing);
}

final class ListingSaveEvent extends AddAndEditListingEvent {
  final ListingModel? listing;

  ListingSaveEvent(this.listing);
}
