class CalculationBookingPriceUtil {
  static int calculateTotalPrice(
    DateTime startDate,
    DateTime endDate,
    int startingPrice,
  ) {
    final totalDays = endDate.difference(startDate).inDays + 1;
    return startingPrice * totalDays;
  }
}
