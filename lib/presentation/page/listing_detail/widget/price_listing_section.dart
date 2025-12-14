import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/util/ui_helper.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_button.dart';
import 'package:marketplace_musical_instruments_app/core/widget/information_dialog_box.dart';
import 'package:marketplace_musical_instruments_app/domain/entity/listing_entity.dart';
import 'package:marketplace_musical_instruments_app/generated/l10n.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/booking_save/booking_save_cubit.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/save_listing/save_listing_state.dart';

class PriceListingSection extends StatelessWidget {
  final ListingEntity listing;

  const PriceListingSection({
    super.key,
    required this.listing,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: MediaQuery.textScalerOf(context).scale(18),
      color: Colors.grey[600],
      fontWeight: FontWeight.w500,
    );
    return SafeArea(
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
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
                  S.of(context).price,
                  style: textStyle,
                ),
                RichText(
                  text: TextSpan(
                    text: '\$30',
                    style: Theme.of(context).textTheme.bodyLarge,
                    children: [
                      TextSpan(
                        text: '/hr',
                        style: textStyle,
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
  final ListingEntity listing;

  const _BookingButton({
    required this.listing,
  });

  @override
  Widget build(BuildContext context) {
    final buttonStatus = context.select(
      (BookingSaveCubit bloc) => bloc.state.buttonStatus,
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
            UiHelper.showConfirmDialog(
              context,
              InformationDialogBox(
                isDeleting: false,
                title: S.of(context).confirmBooking,
                description: S
                    .of(context)
                    .youreGoingToBookThisInstrumentAreYouSure,
                onClickActionButton: () {
                  context.read<BookingSaveCubit>().createBooking(listing);
                  Navigator.pop(context);
                },
              ),
            );
          };
    return CommonButton(
      onPressed: onPressed,
      width: MediaQuery.of(context).size.width / 2,
      color: color,
      child: Text(
        S.of(context).bookNow,
        style: TextStyle(
          fontSize: 18,
          color: textColor,
        ),
      ),
    );
  }
}
