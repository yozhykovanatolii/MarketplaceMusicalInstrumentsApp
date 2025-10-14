import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class ReviewModel {
  final String id;
  final int rating;
  final String reviewText;

  ReviewModel({
    required this.id,
    required this.rating,
    required this.reviewText,
  });

  ReviewModel copyWith({
    String? id,
    int? rating,
    String? reviewText,
  }) {
    return ReviewModel(
      id: id ?? this.id,
      rating: rating ?? this.rating,
      reviewText: reviewText ?? this.reviewText,
    );
  }

  factory ReviewModel.initial() {
    return ReviewModel(
      id: const Uuid().v1(),
      rating: 0,
      reviewText: '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return <String, dynamic>{
      'rating': rating,
      'reviewText': reviewText,
    };
  }

  factory ReviewModel.fromMap(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return ReviewModel(
      id: data?['id'] as String,
      rating: data?['rating'] as int,
      reviewText: data?['reviewText'] as String,
    );
  }
}
