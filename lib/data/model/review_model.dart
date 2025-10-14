import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class ReviewModel {
  final String id;
  final String viewerId;
  final String viewerFullName;
  final int rating;
  final String reviewText;

  ReviewModel({
    required this.id,
    required this.viewerId,
    required this.viewerFullName,
    required this.rating,
    required this.reviewText,
  });

  ReviewModel copyWith({
    String? id,
    String? viewerId,
    String? viewerFullName,
    int? rating,
    String? reviewText,
  }) {
    return ReviewModel(
      id: id ?? this.id,
      viewerId: viewerId ?? this.viewerId,
      viewerFullName: viewerFullName ?? this.viewerFullName,
      rating: rating ?? this.rating,
      reviewText: reviewText ?? this.reviewText,
    );
  }

  factory ReviewModel.initial() {
    return ReviewModel(
      id: const Uuid().v1(),
      viewerId: '',
      viewerFullName: '',
      rating: 0,
      reviewText: '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return <String, dynamic>{
      'id': id,
      'viewerId': viewerId,
      'viewerFullName': viewerFullName,
      'rating': rating,
      'reviewText': reviewText,
    };
  }

  factory ReviewModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return ReviewModel(
      id: data?['id'] as String,
      viewerId: data?['viewerId'] as String,
      viewerFullName: data?['viewerFullName'] as String,
      rating: data?['rating'] as int,
      reviewText: data?['reviewText'] as String,
    );
  }
}
