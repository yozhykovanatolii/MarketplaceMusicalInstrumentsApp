import 'package:cloud_firestore/cloud_firestore.dart';

class ListingModel {
  final String id;
  final String title;
  final String description;
  final String category;
  final int priceByHour;
  final List<String> photos;
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
      photos: [],
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
      photos: data?['photos'] as List<String>,
      location: Map<String, double>.from(
        (data?['location'] as Map<String, double>),
      ),
      authorId: data?['authorId'] as String,
      authorFullName: data?['authorFullName'] as String,
    );
  }
}
