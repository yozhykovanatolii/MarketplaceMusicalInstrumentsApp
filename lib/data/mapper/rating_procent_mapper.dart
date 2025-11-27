import 'package:marketplace_musical_instruments_app/core/util/calculation_rating_util.dart';
import 'package:marketplace_musical_instruments_app/data/model/review_model.dart';
import 'package:marketplace_musical_instruments_app/domain/entity/rating_procent_entity.dart';

class RatingProcentMapper {
  static List<RatingProcentEntity> toEntity(
    List<ReviewModel> reviews,
    int reviewerCount,
  ) {
    final ratingsProcent = CalculationRatingUtil.calculateProcentForEachRatings(
      reviews,
      reviewerCount,
    );
    return List.generate(
      5,
      (index) => RatingProcentEntity(
        star: '${5 - index}',
        procent: ratingsProcent['${5 - index}'] ?? 0,
      ),
    );
  }
}
