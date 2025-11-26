import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/exception/booking/booking_requests_not_found.dart';
import 'package:marketplace_musical_instruments_app/core/exception/booking/user_bookings_not_found.dart';
import 'package:marketplace_musical_instruments_app/core/exception/auth/user_not_found_exception.dart';
import 'package:marketplace_musical_instruments_app/data/repository/booking_repository.dart';
import 'package:marketplace_musical_instruments_app/domain/entity/booking_entity.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/booking_overview/booking_overview_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/booking_overview/booking_overview_state.dart';

class BookingOverviewBloc
    extends Bloc<BookingOverviewEvent, BookingOverviewState> {
  final _bookingRepository = BookingRepository();

  BookingOverviewBloc() : super(BookingInitial()) {
    on<UserBookingsFetchEvent>(_fetchUserBookings);
    on<UserBookingsRequestsFetchEvent>(_fetchUserBookingsRequests);
    on<AuthorAcceptRequestEvent>(_acceptBookingStatus);
  }

  Future<void> _fetchUserBookings(
    UserBookingsFetchEvent event,
    Emitter<BookingOverviewState> emit,
  ) async {
    emit(BookingLoading());
    try {
      final userBookings = await _bookingRepository.getAllUserBookings();
      emit(BookingSuccess(userBookings));
    } on UserNotFoundException catch (exception) {
      emit(BookingFailure(exception.errorMessage));
    } on UserBookingsNotFound catch (exception) {
      emit(BookingFailure(exception.errorMessage));
    }
  }

  Future<void> _fetchUserBookingsRequests(
    UserBookingsRequestsFetchEvent event,
    Emitter<BookingOverviewState> emit,
  ) async {
    emit(BookingLoading());
    await emit.forEach<List<BookingEntity>>(
      _bookingRepository.getAllUserBookingRequests(),
      onData: (requests) => BookingSuccess(requests),
      onError: (error, stackTrace) {
        final String errorMessage = error is UserNotFoundException
            ? error.errorMessage
            : (error as BookingRequestsNotFound).errorMessage;
        return BookingFailure(errorMessage);
      },
    );
  }

  Future<void> _acceptBookingStatus(
    AuthorAcceptRequestEvent event,
    Emitter<BookingOverviewState> emit,
  ) async {
    if (event.isAccepted) {
      await _bookingRepository.changeBookingStatus(
        'Confirmed',
        event.bookingId,
      );
    } else {
      await _bookingRepository.changeBookingStatus(
        'Canceled by author',
        event.bookingId,
      );
    }
  }
}
