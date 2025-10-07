import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_progress_indicator.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/booking_overview/booking_overview_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/booking_overview/booking_overview_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/booking_overview/booking_overview_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/my_bookings/widget/booking_card.dart';

class MyBookingsPage extends StatefulWidget {
  const MyBookingsPage({super.key});

  @override
  State<MyBookingsPage> createState() => _MyBookingsPageState();
}

class _MyBookingsPageState extends State<MyBookingsPage> {
  @override
  void initState() {
    context.read<BookingOverviewBloc>().add(
      UserBookingsFetchEvent(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Bookings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<BookingOverviewBloc, BookingOverviewState>(
        builder: (BuildContext context, BookingOverviewState state) {
          if (state is BookingFailure) {
            return Center(
              child: Text(
                state.errorMessage,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }
          if (state is BookingSuccess) {
            final userBookings = state.bookings;
            return ListView.separated(
              itemCount: userBookings.length,
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) {
                return BookingCard(
                  booking: userBookings[index],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 20);
              },
            );
          }
          return const Center(
            child: CommonProgressIndicator(
              scale: 1.2,
              color: Colors.blue,
            ),
          );
        },
      ),
    );
  }
}
