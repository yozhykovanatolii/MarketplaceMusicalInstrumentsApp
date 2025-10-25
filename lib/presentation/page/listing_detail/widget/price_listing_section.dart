import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_button.dart';
import 'package:marketplace_musical_instruments_app/core/widget/information_dialog_box.dart';
import 'package:marketplace_musical_instruments_app/data/model/listing_model.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/booking_save/booking_save_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/booking_save/booking_save_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/save_listing/save_listing_state.dart';

class PriceListingSection extends StatelessWidget {
  final ListingModel listing;

  const PriceListingSection({
    super.key,
    required this.listing,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: Colors.black,
            width: 0.4,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price',
                  style: TextStyle(
                    fontSize: MediaQuery.textScalerOf(context).scale(18),
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: '\$30',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: MediaQuery.textScalerOf(context).scale(23),
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: '/hr',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                          fontSize: MediaQuery.textScalerOf(context).scale(18),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            _BookingButton(
              listing: listing,
            ),
          ],
        ),
      ),
    );
  }
}

class _BookingButton extends StatelessWidget {
  final ListingModel listing;

  const _BookingButton({
    super.key,
    required this.listing,
  });

  @override
  Widget build(BuildContext context) {
    final buttonStatus = context.select(
      (BookingSaveBloc bloc) => bloc.state.buttonStatus,
    );
    final color = buttonStatus == ButtonStatus.disabled
        ? Colors.grey
        : Colors.blue;
    final textColor = buttonStatus == ButtonStatus.disabled
        ? Colors.black
        : Colors.white;
    final onPressed = buttonStatus == ButtonStatus.disabled
        ? null
        : () {
            showDialog(
              context: context,
              builder: (context) => InformationDialogBox(
                isDeleting: false,
                title: 'Confirm Booking',
                description:
                    'You\'re going to book this instrument. Are you sure?',
                onClickActionButton: () {
                  context.read<BookingSaveBloc>().add(
                    BookingCreateEvent(listing),
                  );
                  print('Success booking');
                },
              ),
            );
          };
    return CommonButton(
      onPressed: onPressed,
      width: MediaQuery.of(context).size.width / 2,
      color: color,
      child: Text(
        'Book Now',
        style: TextStyle(
          fontSize: 18,
          color: textColor,
        ),
      ),
    );
  }
}
