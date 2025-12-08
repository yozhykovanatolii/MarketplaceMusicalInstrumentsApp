import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketplace_musical_instruments_app/core/helper/ui_helper.dart';
import 'package:marketplace_musical_instruments_app/core/navigation/app_routes.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_progress_indicator.dart';
import 'package:marketplace_musical_instruments_app/generated/l10n.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/app/app_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/app/app_state.dart';
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
        title: Text(
          S.of(context).myBookings,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocListener<AppBloc, AppState>(
        listener: (context, state) {
          if (state is UserUnauthenticatedState) {
            UiHelper.showSnackBar(
              context: context,
              message: state.errorMessage,
              isErrorSnackBar: true,
            );
            context.go(AppRoutes.loginPage);
          }
        },
        child: BlocBuilder<BookingOverviewBloc, BookingOverviewState>(
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
      ),
    );
  }
}
