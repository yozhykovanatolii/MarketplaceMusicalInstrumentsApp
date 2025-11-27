import 'package:marketplace_musical_instruments_app/data/model/review_model.dart';
import 'package:marketplace_musical_instruments_app/domain/entity/review_entity.dart';

class ReviewMapper {
  static ReviewEntity toEntity(ReviewModel reviewModel) {
    return ReviewEntity(
      id: reviewModel.id,
      authorAvatarUrl: reviewModel.viewerAvatar,
      authorFullName: reviewModel.viewerFullName,
      rating: reviewModel.rating,
      text: reviewModel.reviewText,
    );
  }
}
