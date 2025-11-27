import 'package:marketplace_musical_instruments_app/core/service/user_auth_service.dart';
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
  final _userFirestore = UserFirestore();
  final _listingFirestore = ListingFirestore();
  final _reviewFirestore = ReviewFirestore();

  Future<void> saveReview(
    int rating,
    String reviewText,
    double currentAverage,
    int reviewerCount,
    String listingId,
  ) async {
    final viewerId = UserAuthService.userId;
    final userModel = await _userFirestore.getUserModelById(viewerId);
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
    await _listingFirestore.updateListingAverageRatingAndCounter(
      listingId,
      newAverageRating,
      reviewerCount + 1,
    );
    await _reviewFirestore.saveReviewModel(reviewModel, listingId);
  }

  Stream<ReviewSummaryEntity> getListingRatingAndAllReviews(
    String listingId,
  ) {
    final reviewsStream = _reviewFirestore.getAllListingReviews(listingId);
    return reviewsStream.asyncMap((reviews) async {
      final ratingAndReviewerCountStream = _listingFirestore
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
