enum BookingStatus {
  unconfirmed(color: 0xFFFF0000, text: 'Unconfirmed'),
  confirmed(color: 0xFF00FF00, text: 'Confirmed'),
  cancelledByAuthor(color: 0xFFFFFF00, text: 'Cancelled by author');

  final int color;
  final String text;

  const BookingStatus({
    required this.color,
    required this.text,
  });
}

class BookingEntity {
  final String id;
  final String renterAvatar;
  final String renterFullName;
  final String listingTitle;
  final String listingPhoto;
  final String listingCategory;
  final String startDate;
  final String endDate;
  final int totalPrice;
  final BookingStatus status;

  BookingEntity({
    required this.id,
    required this.renterAvatar,
    required this.renterFullName,
    required this.listingTitle,
    required this.listingPhoto,
    required this.listingCategory,
    required this.startDate,
    required this.endDate,
    required this.totalPrice,
    required this.status,
  });
}
