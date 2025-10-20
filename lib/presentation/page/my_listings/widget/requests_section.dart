import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_button.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_progress_indicator.dart';
import 'package:marketplace_musical_instruments_app/data/model/booking_model.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/booking_overview/booking_overview_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/booking_overview/booking_overview_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/booking_overview/booking_overview_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/listing_detail/widget/user_avatar_and_full_name.dart';

class RequestsSection extends StatefulWidget {
  const RequestsSection({super.key});

  @override
  State<RequestsSection> createState() => _RequestsSectionState();
}

class _RequestsSectionState extends State<RequestsSection> {
  @override
  void initState() {
    context.read<BookingOverviewBloc>().add(
      UserBookingsRequestsFetchEvent(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingOverviewBloc, BookingOverviewState>(
      builder: (context, state) {
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
          final requests = state.bookings;
          return GroupedListView<BookingModel, String>(
            elements: requests,
            groupBy: (request) {
              return "${request.startDate.day.toString().padLeft(2, '0')}.${request.startDate.month.toString().padLeft(2, '0')}.${request.startDate.year}";
            },
            groupSeparatorBuilder: (String date) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                date,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            itemBuilder: (context, request) {
              return _RequestCard(request: request);
            },
            physics: const BouncingScrollPhysics(),
          );
        }
        return const Center(
          child: CommonProgressIndicator(
            scale: 1.2,
            color: Colors.blue,
          ),
        );
      },
    );
  }
}

class _RequestCard extends StatelessWidget {
  final BookingModel request;

  const _RequestCard({
    super.key,
    required this.request,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: const Color(0xFF797979),
      fontWeight: FontWeight.w500,
      fontSize: MediaQuery.textScalerOf(context).scale(17),
    );
    return Card(
      elevation: 5,
      color: const Color(0xFFF6F6F6),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserAvatarAndFullName(
              authorAvatar: request.renterAvatar,
              authorFullName: request.renterFullName,
            ),
            const SizedBox(height: 10),
            Text(
              'Listing',
              style: textStyle,
            ),
            const SizedBox(height: 10),
            Text(
              'Prepared Hero Emergency Fire Blanket 303',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: MediaQuery.textScalerOf(context).scale(17),
              ),
            ),
            const SizedBox(height: 15),
            const Divider(),
            const SizedBox(height: 15),
            _RequestInformation(
              leftWidget: Text('Pick-Up Date', style: textStyle),
              rightWidget: Text(
                "${request.startDate.day.toString().padLeft(2, '0')}.${request.startDate.month.toString().padLeft(2, '0')}.${request.startDate.year}",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.textScalerOf(context).scale(17),
                ),
              ),
            ),
            const SizedBox(height: 10),
            _RequestInformation(
              leftWidget: Text('Return Date', style: textStyle),
              rightWidget: Text(
                "${request.endDate.day.toString().padLeft(2, '0')}.${request.endDate.month.toString().padLeft(2, '0')}.${request.endDate.year}",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.textScalerOf(context).scale(17),
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Divider(),
            const SizedBox(height: 15),
            _RequestInformation(
              leftWidget: Text('Total price', style: textStyle),
              rightWidget: Text(
                '\$${request.totalPrice}',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.textScalerOf(context).scale(17),
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Divider(),
            const SizedBox(height: 15),
            _RequestInformation(
              leftWidget: _RequestActionButton(
                text: 'Accept',
                bookingId: request.id,
              ),
              rightWidget: _RequestActionButton(
                text: 'Cancel',
                isAccepted: false,
                bookingId: request.id,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RequestInformation extends StatelessWidget {
  final Widget leftWidget;
  final Widget rightWidget;

  const _RequestInformation({
    super.key,
    required this.leftWidget,
    required this.rightWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 10,
      children: [
        Flexible(child: leftWidget),
        Flexible(child: rightWidget),
      ],
    );
  }
}

class _RequestActionButton extends StatelessWidget {
  final String text;
  final bool isAccepted;
  final String bookingId;

  const _RequestActionButton({
    super.key,
    required this.text,
    required this.bookingId,
    this.isAccepted = true,
  });

  @override
  Widget build(BuildContext context) {
    return CommonButton(
      onPressed: () {
        context.read<BookingOverviewBloc>().add(
          AuthorAcceptRequestEvent(isAccepted, bookingId),
        );
      },
      width: MediaQuery.of(context).size.width / 2,
      color: isAccepted ? Colors.green : Colors.red,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }
}
