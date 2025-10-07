import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/data/repository/booking_repository.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/booking_overview/booking_overview_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/booking_overview/booking_overview_state.dart';

class BookingOverviewBloc
    extends Bloc<BookingOverviewEvent, BookingOverviewState> {
  final _bookingRepository = BookingRepository();

  BookingOverviewBloc() : super(BookingInitial()) {
    on<UserBookingsFetchEvent>(_fetchUserBookings);
  }

  Future<void> _fetchUserBookings(
    UserBookingsFetchEvent event,
    Emitter<BookingOverviewState> emit,
  ) async {
    emit(BookingLoading());
    try {
      final userBookings = await _bookingRepository.getAllUserBookings();
      emit(BookingSuccess(userBookings));
    } catch (exception) {
      emit(BookingFailure(exception.toString()));
    }
  }
}
