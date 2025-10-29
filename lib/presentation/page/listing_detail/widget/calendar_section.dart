import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:marketplace_musical_instruments_app/generated/l10n.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/booking_save/booking_save_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/booking_save/booking_save_event.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarSection extends StatelessWidget {
  final String listingId;
  final int startingPrice;

  const CalendarSection({
    super.key,
    required this.listingId,
    required this.startingPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).bookingCalendar,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 5),
          Text(
            S.of(context).reserveInstruction,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(height: 10),
          _BookingCalendar(
            listingId: listingId,
            startingPrice: startingPrice,
          ),
          const SizedBox(height: 25),
          const _TotalBookingPriceSubSection(),
        ],
      ),
    );
  }
}

class _BookingCalendar extends StatelessWidget {
  final String listingId;
  final int startingPrice;

  const _BookingCalendar({
    super.key,
    required this.listingId,
    required this.startingPrice,
  });

  @override
  Widget build(BuildContext context) {
    final calendarTextFontSize = MediaQuery.textScalerOf(context).scale(17);
    final bookingSaveState = context.watch<BookingSaveBloc>().state;
    return TableCalendar(
      daysOfWeekHeight: 20,
      firstDay: DateTime.now(),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: DateTime.now(),
      rangeSelectionMode: RangeSelectionMode.toggledOn,
      rangeStartDay: bookingSaveState.startBookingDate,
      rangeEndDay: bookingSaveState.endBookingDate,
      onRangeSelected: (start, end, focusedDay) {
        context.read<BookingSaveBloc>().add(
          BookingTotalCalculateEvent(listingId, start, end, startingPrice),
        );
      },
      headerStyle: HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
        titleTextStyle: TextStyle(
          fontSize: MediaQuery.textScalerOf(context).scale(19),
          fontWeight: FontWeight.bold,
        ),
        leftChevronIcon: const Icon(
          Iconsax.arrow_square_left_copy,
          size: 30,
          color: Colors.blue,
        ),
        rightChevronIcon: const Icon(
          Iconsax.arrow_right_copy,
          size: 30,
          color: Colors.blue,
        ),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: calendarTextFontSize,
        ),
        weekdayStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: calendarTextFontSize,
        ),
      ),
      calendarStyle: CalendarStyle(
        todayTextStyle: TextStyle(
          fontSize: calendarTextFontSize,
          color: Colors.white,
        ),
        rangeStartTextStyle: TextStyle(
          fontSize: calendarTextFontSize,
          color: Colors.white,
        ),
        withinRangeTextStyle: TextStyle(fontSize: calendarTextFontSize),
        weekendTextStyle: TextStyle(fontSize: calendarTextFontSize),
        defaultTextStyle: TextStyle(fontSize: calendarTextFontSize),
        outsideTextStyle: TextStyle(
          fontSize: calendarTextFontSize,
          color: const Color(0xFFAEAEAE),
        ),
        disabledTextStyle: TextStyle(
          fontSize: calendarTextFontSize,
          color: const Color(0xFFAEAEAE),
        ),
      ),
    );
  }
}

class _TotalBookingPriceSubSection extends StatelessWidget {
  const _TotalBookingPriceSubSection({super.key});

  @override
  Widget build(BuildContext context) {
    final totalPriceText = context.select(
      (BookingSaveBloc bloc) => bloc.state.totalPriceText,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).totalPrice,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Text(
          totalPriceText,
          style: TextStyle(
            fontSize: MediaQuery.textScalerOf(context).scale(23),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
