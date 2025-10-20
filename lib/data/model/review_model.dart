import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class ReviewModel {
  final String id;
  final String viewerId;
  final String viewerAvatar;
  final String viewerFullName;
  final int rating;
  final String reviewText;

  ReviewModel({
    required this.id,
    required this.viewerId,
    required this.viewerAvatar,
    required this.viewerFullName,
    required this.rating,
    required this.reviewText,
  });

  ReviewModel copyWith({
    String? id,
    String? viewerId,
    String? viewerAvatar,
    String? viewerFullName,
    int? rating,
    String? reviewText,
  }) {
    return ReviewModel(
      id: id ?? this.id,
      viewerId: viewerId ?? this.viewerId,
      viewerAvatar: viewerAvatar ?? this.viewerAvatar,
      viewerFullName: viewerFullName ?? this.viewerFullName,
      rating: rating ?? this.rating,
      reviewText: reviewText ?? this.reviewText,
    );
  }

  factory ReviewModel.initial() {
    return ReviewModel(
      id: const Uuid().v1(),
      viewerId: '',
      viewerAvatar: '',
      viewerFullName: '',
      rating: 0,
      reviewText: '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return <String, dynamic>{
      'id': id,
      'viewerId': viewerId,
      'viewerAvatar': viewerAvatar,
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
      viewerAvatar: data?['viewerAvatar'] as String,
      viewerFullName: data?['viewerFullName'] as String,
      rating: data?['rating'] as int,
      reviewText: data?['reviewText'] as String,
    );
  }
}
