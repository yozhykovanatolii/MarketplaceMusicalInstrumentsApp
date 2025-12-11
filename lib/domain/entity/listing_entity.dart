import 'package:marketplace_musical_instruments_app/domain/entity/location_entity.dart';

class ListingEntity {
  final String id;
  final String title;
  final String description;
  final String category;
  final int priceByHour;
  final List<String> photos;
  final double averageRating;
  final int reviewerCount;
  final LocationEntity location;
  final String authorId;
  final String authorFullName;
  final String authorPhoneNumber;
  final String authorAvatar;

  ListingEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.priceByHour,
    required this.photos,
    required this.averageRating,
    required this.reviewerCount,
    required this.location,
    required this.authorId,
    required this.authorFullName,
    required this.authorPhoneNumber,
    required this.authorAvatar,
  });

  ListingEntity copyWith({
    String? id,
    String? title,
    String? description,
    String? category,
    int? priceByHour,
    List<String>? photos,
    double? averageRating,
    int? reviewerCount,
    LocationEntity? location,
    String? authorId,
    String? authorFullName,
    String? authorPhoneNumber,
    String? authorAvatar,
  }) {
    return ListingEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      priceByHour: priceByHour ?? this.priceByHour,
      photos: photos ?? this.photos,
      averageRating: averageRating ?? this.averageRating,
      reviewerCount: reviewerCount ?? this.reviewerCount,
      location: location ?? this.location,
      authorId: authorId ?? this.authorId,
      authorFullName: authorFullName ?? this.authorFullName,
      authorPhoneNumber: authorPhoneNumber ?? this.authorPhoneNumber,
      authorAvatar: authorAvatar ?? this.authorAvatar,
    );
  }
}
