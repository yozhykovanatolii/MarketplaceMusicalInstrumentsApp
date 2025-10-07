import 'package:marketplace_musical_instruments_app/data/model/listing_model.dart';

sealed class BookingSaveEvent {}

final class BookingTotalCalculateEvent extends BookingSaveEvent {
  final String listingId;
  final DateTime? startDate;
  final DateTime? endDate;
  final int startingPrice;

  BookingTotalCalculateEvent(
    this.listingId,
    this.startDate,
    this.endDate,
    this.startingPrice,
  );
}

final class BookingCreateEvent extends BookingSaveEvent {
  final ListingModel listingModel;

  BookingCreateEvent(this.listingModel);
}
