import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/save_listing/save_listing_state.dart';

class BookingSaveState {
  final DateTime? startBookingDate;
  final DateTime? endBookingDate;
  final String totalPriceText;
  final ButtonStatus buttonStatus;
  final FormStatus formStatus;
  final String errorMessage;

  BookingSaveState({
    this.startBookingDate,
    this.endBookingDate,
    required this.totalPriceText,
    required this.buttonStatus,
    required this.formStatus,
    required this.errorMessage,
  });

  factory BookingSaveState.initial() {
    return BookingSaveState(
      totalPriceText: '',
      errorMessage: '',
      buttonStatus: ButtonStatus.disabled,
      formStatus: FormStatus.initial,
    );
  }

  BookingSaveState copyWith({
    DateTime? startBookingDate,
    DateTime? endBookingDate,
    String? totalPriceText,
    ButtonStatus? buttonStatus,
    FormStatus? formStatus,
    String? errorMessage,
  }) {
    return BookingSaveState(
      startBookingDate: startBookingDate ?? this.startBookingDate,
      endBookingDate: endBookingDate ?? this.endBookingDate,
      totalPriceText: totalPriceText ?? this.totalPriceText,
      buttonStatus: buttonStatus ?? this.buttonStatus,
      formStatus: formStatus ?? this.formStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
