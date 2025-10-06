import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarSection extends StatefulWidget {
  const CalendarSection({super.key});

  @override
  State<CalendarSection> createState() => _CalendarSectionState();
}

class _CalendarSectionState extends State<CalendarSection> {
  DateTime? _startDate;
  DateTime? _endDate;
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final textFontSize = MediaQuery.textScalerOf(context).scale(17);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Booking Calendar',
            style: TextStyle(
              fontSize: MediaQuery.textScalerOf(context).scale(18),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'To reserve an instrument, you must select the start and end dates of your reservation. If the instrument is occupied on the selected dates, it will not be available for reservation.',
            style: TextStyle(
              fontSize: MediaQuery.textScalerOf(context).scale(17),
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 10),
          TableCalendar(
            daysOfWeekHeight: 20,
            firstDay: DateTime.now(),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _focusedDay,
            rangeSelectionMode: RangeSelectionMode.toggledOn,
            rangeStartDay: _startDate,
            rangeEndDay: _endDate,
            onRangeSelected: (start, end, focusedDay) {
              setState(() {
                _startDate = start;
                _endDate = end;
                _focusedDay = focusedDay;
              });
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
                fontSize: textFontSize,
              ),
              weekdayStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: textFontSize,
              ),
            ),
            calendarStyle: CalendarStyle(
              todayTextStyle: TextStyle(
                fontSize: textFontSize,
                color: Colors.white,
              ),
              rangeStartTextStyle: TextStyle(
                fontSize: textFontSize,
                color: Colors.white,
              ),
              withinRangeTextStyle: TextStyle(fontSize: textFontSize),
              weekendTextStyle: TextStyle(fontSize: textFontSize),
              defaultTextStyle: TextStyle(fontSize: textFontSize),
              outsideTextStyle: TextStyle(
                fontSize: textFontSize,
                color: const Color(0xFFAEAEAE),
              ),
              disabledTextStyle: TextStyle(
                fontSize: textFontSize,
                color: const Color(0xFFAEAEAE),
              ),
            ),
          ),
          const SizedBox(height: 25),
          const _TotalBookingPriceSubSection(),
        ],
      ),
    );
  }
}

class _TotalBookingPriceSubSection extends StatelessWidget {
  const _TotalBookingPriceSubSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Total price',
          style: TextStyle(
            fontSize: MediaQuery.textScalerOf(context).scale(18),
            color: Colors.grey[600],
          ),
        ),
        Text(
          '\$300',
          style: TextStyle(
            fontSize: MediaQuery.textScalerOf(context).scale(23),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
