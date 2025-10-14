import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marketplace_musical_instruments_app/data/model/review_model.dart';

class ReviewFirestore {
  final _firestore = FirebaseFirestore.instance;

  Future<void> saveReviewModel(
    ReviewModel reviewModel,
    String listingId,
  ) async {
    final docReference = getReviewDocumentReference(reviewModel.id, listingId);
    await docReference.set(reviewModel);
  }

  DocumentReference<ReviewModel> getReviewDocumentReference(
    String reviewId,
    String listingId,
  ) {
    return _firestore
        .collection('listings')
        .doc(listingId)
        .collection('reviews')
        .doc(reviewId)
        .withConverter(
          fromFirestore: ReviewModel.fromFirestore,
          toFirestore: (ReviewModel userModel, options) =>
              userModel.toFirestore(),
        );
  }
}
