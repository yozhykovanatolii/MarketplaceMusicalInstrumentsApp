class BookingSaveState {
  final DateTime? startBookingDate;
  final DateTime? endBookingDate;
  final String totalPriceText;
  final String errorMessage;

  BookingSaveState({
    required this.totalPriceText,
    required this.errorMessage,
    this.startBookingDate,
    this.endBookingDate,
  });

  factory BookingSaveState.initial() {
    return BookingSaveState(
      totalPriceText: '',
      errorMessage: '',
    );
  }

  BookingSaveState copyWith({
    DateTime? startBookingDate,
    DateTime? endBookingDate,
    String? totalPriceText,
    String? errorMessage,
  }) {
    return BookingSaveState(
      startBookingDate: startBookingDate ?? this.startBookingDate,
      endBookingDate: endBookingDate ?? this.endBookingDate,
      totalPriceText: totalPriceText ?? this.totalPriceText,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
