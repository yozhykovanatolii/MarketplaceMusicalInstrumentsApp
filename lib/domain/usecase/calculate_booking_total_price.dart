class CalculateBookingTotalPriceUseCase {
  int calculateTotalPrice(
    DateTime startDate,
    DateTime endDate,
    int listingStartingPrice,
  ) {
    final totalDays = endDate.difference(startDate).inDays + 1;
    return listingStartingPrice * totalDays;
  }
}
