import 'package:marketplace_musical_instruments_app/data/model/review_model.dart';

class CalculationRatingUtil {
  static Map<String, double> calculateProcentForEachRatings(
    List<ReviewModel> reviews,
    int reviewerCount,
  ) {
    Map<String, double> ratingsProcent = {
      '1': 0,
      '2': 0,
      '3': 0,
      '4': 0,
      '5': 0,
    };
    if (reviews.isEmpty) return ratingsProcent;
    for (int index = 1; index <= 5; index++) {
      final count = reviews.where((review) => review.rating == index).length;
      ratingsProcent['$index'] = count / reviewerCount;
    }
    return ratingsProcent;
  }

  static double calculateNewAverageRating(
    double currentAverage,
    int currentCount,
    int reviewRating,
  ) {
    double newAverage =
        (currentAverage * currentCount + reviewRating) / (currentCount + 1);
    return (newAverage * 10).roundToDouble() / 10;
  }
}
