import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/util/calculation_booking_price_util.dart';
import 'package:marketplace_musical_instruments_app/data/repository/booking_repository.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/booking_save/booking_save_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/booking_save/booking_save_state.dart';

class BookingSaveBloc extends Bloc<BookingSaveEvent, BookingSaveState> {
  final _bookingRepository = BookingRepository();

  BookingSaveBloc() : super(BookingSaveState.initial()) {
    on<BookingTotalCalculateEvent>(_calculateBookingTotalPrice);
    on<BookingCreateEvent>(_createBooking);
  }

  void _calculateBookingTotalPrice(
    BookingTotalCalculateEvent event,
    Emitter<BookingSaveState> emit,
  ) {
    final startDate = event.startDate;
    final endDate = event.endDate;
    if (startDate == null || endDate == null) return;
    final totalPrice = CalculationBookingPriceUtil.calculateTotalPrice(
      startDate,
      endDate,
      event.startingPrice,
    );
    emit(
      state.copyWith(
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
    print(totalPriceText);
    if (startBookingDate == null || endBookingDate == null) return;
    try {
      await _bookingRepository.createBooking(
        event.listingModel,
        startBookingDate,
        endBookingDate,
        int.parse(totalPriceText),
      );
      print('✅ Booking saved');
    } catch (exception) {
      print('❌ Firestore error: $exception');
      emit(state.copyWith(errorMessage: exception.toString()));
    }
  }
}
