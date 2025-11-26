class ListingValidator {
  static String? validateTitle(String title) {
    if (title.isEmpty) return "The title must not be empty.";
    if (title.length > 50) return "The title must not exceed 50 characters";
    return null;
  }

  static String? validateDescription(String description) {
    if (description.isEmpty) return "The description must not be empty.";
    if (description.length > 9000) {
      return "The description must not exceed 9000 characters";
    }
    return null;
  }

  static String? validateListingPrice(String priceText) {
    if (priceText.isEmpty || priceText.startsWith('-')) {
      return "The price must not be empty or starts with -";
    }
    int price = int.parse(priceText);
    if (price <= 0) {
      return "The price must not be less than or equal to 0.";
    }
    return null;
  }
}
