import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/exception/auth/user_not_found_exception.dart';
import 'package:marketplace_musical_instruments_app/core/util/calculation_booking_price_util.dart';
import 'package:marketplace_musical_instruments_app/data/model/listing_model.dart';
import 'package:marketplace_musical_instruments_app/data/repository/booking_repository.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/booking_save/booking_save_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/save_listing/save_listing_state.dart';

class BookingSaveCubit extends Cubit<BookingSaveState> {
  final _bookingRepository = BookingRepository();

  BookingSaveCubit() : super(BookingSaveState.initial());

  Future<void> calculateBookingTotalPrice(
    String listingId,
    DateTime? startDate,
    DateTime? endDate,
    int startingPrice,
  ) async {
    if (startDate == null || endDate == null) return;
    final isInstrumentBooked = await _bookingRepository.checkIfInstrumentBooked(
      listingId,
      startDate,
      endDate,
    );
    if (isInstrumentBooked) {
      emit(
        state.copyWith(
          buttonStatus: ButtonStatus.disabled,
          formStatus: FormStatus.failure,
          errorMessage:
              'This instrument is already booked for the selected dates.',
        ),
      );
      return;
    }
    final totalPrice = CalculationBookingPriceUtil.calculateTotalPrice(
      startDate,
      endDate,
      startingPrice,
    );
    emit(
      state.copyWith(
        errorMessage: '',
        formStatus: FormStatus.initial,
        buttonStatus: ButtonStatus.enabled,
        startBookingDate: startDate,
        endBookingDate: endDate,
        totalPriceText: '\$${totalPrice.toString()}',
      ),
    );
  }

  Future<void> openCallDialer(String authorPhoneNumber) async {
    try {
      await _bookingRepository.callDialer(authorPhoneNumber);
    } catch (exception) {
      emit(
        state.copyWith(
          errorMessage: exception.toString(),
          formStatus: FormStatus.failure,
        ),
      );
    } finally {
      emit(
        state.copyWith(
          errorMessage: '',
          formStatus: FormStatus.initial,
        ),
      );
    }
  }

  Future<void> createBooking(ListingModel listingModel) async {
    final startBookingDate = state.startBookingDate;
    final endBookingDate = state.endBookingDate;
    final totalPriceText = state.totalPriceText.replaceAll('\$', '');
    if (startBookingDate == null || endBookingDate == null) return;
    try {
      await _bookingRepository.createBooking(
        listingModel,
        startBookingDate,
        endBookingDate,
        int.parse(totalPriceText),
      );
      emit(state.copyWith(formStatus: FormStatus.success));
    } on UserNotFoundException catch (exception) {
      emit(
        state.copyWith(
          errorMessage: exception.errorMessage,
          formStatus: FormStatus.failure,
        ),
      );
    }
  }
}
