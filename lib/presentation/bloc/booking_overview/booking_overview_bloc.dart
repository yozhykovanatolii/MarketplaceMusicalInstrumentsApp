import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/data/model/booking_model.dart';
import 'package:marketplace_musical_instruments_app/data/repository/booking_repository.dart';
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
    } catch (exception) {
      emit(BookingFailure(exception.toString()));
    }
  }

  Future<void> _fetchUserBookingsRequests(
    UserBookingsRequestsFetchEvent event,
    Emitter<BookingOverviewState> emit,
  ) async {
    emit(BookingLoading());
    await emit.forEach<List<BookingModel>>(
      _bookingRepository.getAllUserBookingRequests(),
      onData: (requests) => BookingSuccess(requests),
      onError: (error, stackTrace) => BookingFailure(
        error.toString(),
      ),
    );
  }

  Future<void> _acceptBookingStatus(
    AuthorAcceptRequestEvent event,
    Emitter<BookingOverviewState> emit,
  ) async {
    if (event.isAccepted) {
      await _bookingRepository.changeBookingStatus(
        'Accepted',
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
