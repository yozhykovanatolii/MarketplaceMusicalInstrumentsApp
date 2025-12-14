import 'package:flutter/material.dart';
import 'package:marketplace_musical_instruments_app/core/theme/app_colors.dart';
import 'package:marketplace_musical_instruments_app/core/widget/tag_container.dart';
import 'package:marketplace_musical_instruments_app/domain/entity/booking_entity.dart';
import 'package:marketplace_musical_instruments_app/core/localization/generated/l10n.dart';

class BookingCard extends StatelessWidget {
  final BookingEntity booking;

  const BookingCard({
    super.key,
    required this.booking,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 20,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadiusDirectional.circular(15),
                    child: Image.network(
                      booking.listingPhoto,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TagContainer(
                        text: booking.listingCategory,
                        fontSize: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.fontSize,
                        colorContainer: Colors.grey[200],
                        fontWeight: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.fontWeight,
                        colorText: const Color(AppColors.kBlue),
                      ),
                      Text(
                        booking.listingTitle,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 13),
            const Divider(),
            const SizedBox(height: 13),
            _BookingInformation(
              title: S.of(context).pickupDate,
              widget: Text(
                booking.startDate,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
            const SizedBox(height: 10),
            _BookingInformation(
              title: S.of(context).returnDate,
              widget: Text(
                booking.endDate,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
            const SizedBox(height: 13),
            const Divider(),
            const SizedBox(height: 13),
            _BookingInformation(
              title: S.of(context).totalPrice,
              widget: Text(
                '\$${booking.totalPrice}',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
            const SizedBox(height: 10),
            _BookingInformation(
              title: S.of(context).status,
              widget: TagContainer(
                text: booking.status.text,
                fontSize: MediaQuery.textScalerOf(context).scale(17),
                colorContainer: Color(booking.status.color),
                fontWeight: FontWeight.w600,
                colorText: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BookingInformation extends StatelessWidget {
  final String title;
  final Widget widget;

  const _BookingInformation({
    required this.title,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: const Color(0xFF797979),
            fontWeight: FontWeight.w500,
            fontSize: MediaQuery.textScalerOf(context).scale(17),
          ),
        ),
        widget,
      ],
    );
  }
}
