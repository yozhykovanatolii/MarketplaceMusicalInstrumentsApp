import 'package:marketplace_musical_instruments_app/data/model/listing_model.dart';

sealed class SaveListingEvent {}

final class AddListingPhotoEvent extends SaveListingEvent {}

final class DeleteListingPhotoEvent extends SaveListingEvent {
  final String photoUrl;

  DeleteListingPhotoEvent(this.photoUrl);
}

final class GetUserCurrentLocationEvent extends SaveListingEvent {}

final class ListingTitleChangeEvent extends SaveListingEvent {
  final String title;

  ListingTitleChangeEvent(this.title);
}

final class ListingDecriptionChangeEvent extends SaveListingEvent {
  final String description;

  ListingDecriptionChangeEvent(this.description);
}

final class ListingPriceChangeEvent extends SaveListingEvent {
  final String priceText;

  ListingPriceChangeEvent(this.priceText);
}

final class ListingCategoryChangeEvent extends SaveListingEvent {
  final String category;

  ListingCategoryChangeEvent(this.category);
}

final class ListingEditEvent extends SaveListingEvent {
  final ListingModel? listing;

  ListingEditEvent(this.listing);
}

final class ListingSaveEvent extends SaveListingEvent {
  final ListingModel? listing;

  ListingSaveEvent(this.listing);
}
