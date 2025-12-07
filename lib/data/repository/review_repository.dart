import 'package:marketplace_musical_instruments_app/data/datasource/remote/firebase_auth/user_auth.dart';
import 'package:marketplace_musical_instruments_app/core/util/calculation_rating_util.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/firestore/listing_firestore.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/firestore/review_firestore.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/firestore/user_firestore.dart';
import 'package:marketplace_musical_instruments_app/data/mapper/rating_procent_mapper.dart';
import 'package:marketplace_musical_instruments_app/data/mapper/review_mapper.dart';
import 'package:marketplace_musical_instruments_app/data/mapper/review_summary_mapper.dart';
import 'package:marketplace_musical_instruments_app/data/model/review_model.dart';
import 'package:marketplace_musical_instruments_app/domain/entity/review_summary_entity.dart';

class ReviewRepository {
  final UserFirestore userFirestore;
  final ListingFirestore listingFirestore;
  final UserAuth userAuth;
  final ReviewFirestore reviewFirestore;

  ReviewRepository(
    this.userFirestore,
    this.listingFirestore,
    this.userAuth,
    this.reviewFirestore,
  );

  Future<void> saveReview(
    int rating,
    String reviewText,
    double currentAverage,
    int reviewerCount,
    String listingId,
  ) async {
    final viewerId = userAuth.userId;
    final userModel = await userFirestore.getUserModelById(viewerId);
    ReviewModel reviewModel = ReviewModel.initial();
    reviewModel = reviewModel.copyWith(
      id: reviewModel.id,
      viewerId: viewerId,
      viewerFullName: userModel.fullName,
      viewerAvatar: userModel.avatar,
      rating: rating,
      reviewText: reviewText,
    );
    final newAverageRating = CalculationRatingUtil.calculateNewAverageRating(
      currentAverage,
      reviewerCount,
      rating,
    );
    await listingFirestore.updateListingAverageRatingAndCounter(
      listingId,
      newAverageRating,
      reviewerCount + 1,
    );
    await reviewFirestore.saveReviewModel(reviewModel, listingId);
  }

  Stream<ReviewSummaryEntity> getListingRatingAndAllReviews(
    String listingId,
  ) {
    final reviewsStream = reviewFirestore.getAllListingReviews(listingId);
    return reviewsStream.asyncMap((reviews) async {
      final ratingAndReviewerCountStream = listingFirestore
          .getListingRatingAndReviewerCount(listingId);
      final ratingAndReviewerCount = await ratingAndReviewerCountStream.first;
      final reviewsEntity = reviews
          .map((reviewModel) => ReviewMapper.toEntity(reviewModel))
          .toList();
      final ratingsProcentEntity = RatingProcentMapper.toEntity(
        reviews,
        ratingAndReviewerCount['reviewerCount'] ?? 0,
      );
      return ReviewSummaryMapper.toEntity(
        ratingAndReviewerCount,
        reviewsEntity,
        ratingsProcentEntity,
      );
    });
  }
}
