import 'package:marketplace_musical_instruments_app/data/model/booking_model.dart';
import 'package:marketplace_musical_instruments_app/domain/entity/booking_entity.dart';

class BookingMapper {
  static BookingEntity toEntity(BookingModel bookingModel) {
    return BookingEntity(
      id: bookingModel.id,
      renterAvatar: bookingModel.renterAvatar,
      renterFullName: bookingModel.renterFullName,
      listingTitle: bookingModel.listingTitle,
      listingPhoto: bookingModel.listingPhoto,
      listingCategory: bookingModel.listingCategory,
      startDate:
          "${bookingModel.startDate.day.toString().padLeft(2, '0')}.${bookingModel.startDate.month.toString().padLeft(2, '0')}.${bookingModel.startDate.year}",
      endDate:
          "${bookingModel.endDate.day.toString().padLeft(2, '0')}.${bookingModel.endDate.month.toString().padLeft(2, '0')}.${bookingModel.endDate.year}",
      totalPrice: bookingModel.totalPrice,
      status: BookingStatus.fromText(bookingModel.status),
    );
  }
}
