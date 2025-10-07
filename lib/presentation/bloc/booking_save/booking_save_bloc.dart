import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/util/calculation_booking_price_util.dart';
import 'package:marketplace_musical_instruments_app/data/repository/booking_repository.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/add_and_edit_listing/add_and_edit_listing_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/booking_save/booking_save_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/booking_save/booking_save_state.dart';

class BookingSaveBloc extends Bloc<BookingSaveEvent, BookingSaveState> {
  final _bookingRepository = BookingRepository();

  BookingSaveBloc() : super(BookingSaveState.initial()) {
    on<BookingTotalCalculateEvent>(_calculateBookingTotalPrice);
    on<BookingCreateEvent>(_createBooking);
  }

  Future<void> _calculateBookingTotalPrice(
    BookingTotalCalculateEvent event,
    Emitter<BookingSaveState> emit,
  ) async {
    final startDate = event.startDate;
    final endDate = event.endDate;
    if (startDate == null || endDate == null) return;
    final isInstrumentBooked = await _bookingRepository.checkIfInstrumentBooked(
      event.listingId,
      startDate,
      endDate,
    );
    if (isInstrumentBooked) {
      emit(
        state.copyWith(
          buttonStatus: ButtonStatus.disabled,
          errorMessage:
              'This instrument is already booked for the selected dates.',
        ),
      );
      return;
    }
    final totalPrice = CalculationBookingPriceUtil.calculateTotalPrice(
      startDate,
      endDate,
      event.startingPrice,
    );
    emit(
      state.copyWith(
        errorMessage: '',
        buttonStatus: ButtonStatus.enabled,
        startBookingDate: startDate,
        endBookingDate: endDate,
        totalPriceText: '\$${totalPrice.toString()}',
      ),
    );
  }

  Future<void> _createBooking(
    BookingCreateEvent event,
    Emitter<BookingSaveState> emit,
  ) async {
    final startBookingDate = state.startBookingDate;
    final endBookingDate = state.endBookingDate;
    final totalPriceText = state.totalPriceText.replaceAll('\$', '');
    if (startBookingDate == null || endBookingDate == null) return;
    try {
      await _bookingRepository.createBooking(
        event.listingModel,
        startBookingDate,
        endBookingDate,
        int.parse(totalPriceText),
      );
    } catch (exception) {
      emit(state.copyWith(errorMessage: exception.toString()));
    }
  }
}
