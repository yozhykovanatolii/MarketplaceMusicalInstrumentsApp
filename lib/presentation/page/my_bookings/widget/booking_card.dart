import 'package:flutter/material.dart';
import 'package:marketplace_musical_instruments_app/core/widget/category_listing_section.dart';
import 'package:marketplace_musical_instruments_app/data/model/booking_model.dart';
import 'package:marketplace_musical_instruments_app/generated/l10n.dart';

class BookingCard extends StatelessWidget {
  final BookingModel booking;

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
                      CategoryListingSection(
                        category: booking.listingCategory,
                      ),
                      Text(
                        'Prepared Hero Emergency Fire Blanket 303',
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
                "${booking.startDate.day.toString().padLeft(2, '0')}.${booking.startDate.month.toString().padLeft(2, '0')}.${booking.startDate.year}",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
            const SizedBox(height: 10),
            _BookingInformation(
              title: S.of(context).returnDate,
              widget: Text(
                "${booking.endDate.day.toString().padLeft(2, '0')}.${booking.endDate.month.toString().padLeft(2, '0')}.${booking.endDate.year}",
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
              widget: _StatusSection(
                status: booking.status,
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
    super.key,
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

class _StatusSection extends StatelessWidget {
  final String status;

  const _StatusSection({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          status,
          style: TextStyle(
            fontSize: MediaQuery.textScalerOf(context).scale(17),
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
