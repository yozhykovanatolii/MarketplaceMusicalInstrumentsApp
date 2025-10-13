class ReviewValidatorUtil {
  static String? validateReviewText(String reviewText) {
    if (reviewText.isEmpty) return "The review text must not be empty.";
    if (reviewText.length > 445) {
      return "The review text must not exceed 445 characters";
    }
    return null;
  }
}
