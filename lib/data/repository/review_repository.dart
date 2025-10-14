import 'package:marketplace_musical_instruments_app/data/datasource/remote/listing/listing_firestore.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/user/user_auth.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/user/user_firestore.dart';
import 'package:marketplace_musical_instruments_app/data/model/review_model.dart';

class ReviewRepository {
  final _userAuth = UserAuth();
  final _userFirestore = UserFirestore();
  final _listingFirestore = ListingFirestore();

  Future<void> saveReview(
    int rating,
    String reviewText,
    List<ReviewModel> reviews,
    String listingId,
  ) async {
    final viewerId = _userAuth.userId;
    final userModel = await _userFirestore.getUserModelById(viewerId);
    ReviewModel reviewModel = ReviewModel.initial();
    reviewModel = reviewModel.copyWith(
      id: reviewModel.id,
      viewerId: viewerId,
      viewerFullName: userModel.fullName,
      rating: rating,
      reviewText: reviewText,
    );
    reviews.add(reviewModel);
    List<ReviewModel> updatedReviews = List.from(reviews);
    await _listingFirestore.updateListingReviews(updatedReviews, listingId);
  }
}
