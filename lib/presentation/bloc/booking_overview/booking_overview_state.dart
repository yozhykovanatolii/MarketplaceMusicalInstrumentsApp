import 'package:marketplace_musical_instruments_app/data/model/booking_model.dart';

sealed class BookingOverviewState {}

final class BookingInitial extends BookingOverviewState {}

final class BookingLoading extends BookingOverviewState {}

final class BookingSuccess extends BookingOverviewState {
  final List<BookingModel> bookings;

  BookingSuccess(this.bookings);
}

final class BookingFailure extends BookingOverviewState {
  final String errorMessage;

  BookingFailure(this.errorMessage);
}
