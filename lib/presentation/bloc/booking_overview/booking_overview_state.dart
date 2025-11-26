import 'package:marketplace_musical_instruments_app/domain/entity/booking_entity.dart';

sealed class BookingOverviewState {}

final class BookingInitial extends BookingOverviewState {}

final class BookingLoading extends BookingOverviewState {}

final class BookingSuccess extends BookingOverviewState {
  final List<BookingEntity> bookings;

  BookingSuccess(this.bookings);
}

final class BookingFailure extends BookingOverviewState {
  final String errorMessage;

  BookingFailure(this.errorMessage);
}
