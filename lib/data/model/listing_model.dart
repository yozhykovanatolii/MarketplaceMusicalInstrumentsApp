import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marketplace_musical_instruments_app/data/model/review_model.dart';

class ListingModel {
  final String id;
  final String title;
  final String description;
  final String category;
  final int priceByHour;
  final List<String> photos;
  final double averageRating;
  final int reviewerCount;
  final List<ReviewModel> reviews;
  final Map<String, double> location;
  final String authorId;
  final String authorFullName;

  ListingModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.priceByHour,
    required this.photos,
    required this.averageRating,
    required this.reviewerCount,
    required this.reviews,
    required this.location,
    required this.authorId,
    required this.authorFullName,
  });

  factory ListingModel.initial() {
    return ListingModel(
      id: '',
      title: '',
      description: '',
      category: '',
      priceByHour: 0,
      averageRating: 0.0,
      reviewerCount: 0,
      photos: [],
      reviews: [],
      location: {},
      authorId: '',
      authorFullName: '',
    );
  }

  ListingModel copyWith({
    String? id,
    String? title,
    String? description,
    String? category,
    int? priceByHour,
    List<String>? photos,
    double? averageRating,
    int? reviewerCount,
    List<ReviewModel>? reviews,
    Map<String, double>? location,
    String? authorId,
    String? authorFullName,
  }) {
    return ListingModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      priceByHour: priceByHour ?? this.priceByHour,
      photos: photos ?? this.photos,
      averageRating: averageRating ?? this.averageRating,
      reviewerCount: reviewerCount ?? this.reviewerCount,
      reviews: reviews ?? this.reviews,
      location: location ?? this.location,
      authorId: authorId ?? this.authorId,
      authorFullName: authorFullName ?? this.authorFullName,
    );
  }

  Map<String, dynamic> toFirestore() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'priceByHour': priceByHour,
      'photos': photos,
      'averageRating': averageRating,
      'reviewerCount': reviewerCount,
      'reviews': reviews,
      'location': location,
      'authorId': authorId,
      'authorFullName': authorFullName,
    };
  }

  factory ListingModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return ListingModel(
      id: data?['id'] as String,
      title: data?['title'] as String,
      description: data?['description'] as String,
      category: data?['category'] as String,
      priceByHour: data?['priceByHour'] as int,
      averageRating: data?['averageRating'] as double,
      reviewerCount: data?['reviewerCount'] as int,
      photos:
          (data?['photos'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      reviews:
          (data?['reviews'] as List<dynamic>?)
              ?.map((e) => e as ReviewModel)
              .toList() ??
          [],
      location:
          (data?['location'] as Map<String, dynamic>?)?.map(
            (key, value) => MapEntry(key, (value as num).toDouble()),
          ) ??
          {},
      authorId: data?['authorId'] as String,
      authorFullName: data?['authorFullName'] as String,
    );
  }
}
