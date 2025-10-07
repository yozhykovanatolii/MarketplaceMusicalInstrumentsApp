import 'package:marketplace_musical_instruments_app/presentation/bloc/add_and_edit_listing/add_and_edit_listing_state.dart';

class BookingSaveState {
  final DateTime? startBookingDate;
  final DateTime? endBookingDate;
  final String totalPriceText;
  final ButtonStatus buttonStatus;
  final String errorMessage;

  BookingSaveState({
    required this.totalPriceText,
    required this.errorMessage,
    required this.buttonStatus,
    this.startBookingDate,
    this.endBookingDate,
  });

  factory BookingSaveState.initial() {
    return BookingSaveState(
      totalPriceText: '',
      errorMessage: '',
      buttonStatus: ButtonStatus.disabled,
    );
  }

  BookingSaveState copyWith({
    DateTime? startBookingDate,
    DateTime? endBookingDate,
    String? totalPriceText,
    String? errorMessage,
    ButtonStatus? buttonStatus,
  }) {
    return BookingSaveState(
      startBookingDate: startBookingDate ?? this.startBookingDate,
      endBookingDate: endBookingDate ?? this.endBookingDate,
      totalPriceText: totalPriceText ?? this.totalPriceText,
      errorMessage: errorMessage ?? this.errorMessage,
      buttonStatus: buttonStatus ?? this.buttonStatus,
    );
  }
}
