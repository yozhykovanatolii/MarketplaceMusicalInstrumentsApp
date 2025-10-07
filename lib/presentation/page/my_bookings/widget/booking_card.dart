import 'package:flutter/material.dart';
import 'package:marketplace_musical_instruments_app/core/widget/category_listing_section.dart';
import 'package:marketplace_musical_instruments_app/data/model/booking_model.dart';

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
      color: const Color(0xFFF6F6F6),
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
                        booking.listingTitle,
                        style: TextStyle(
                          fontSize: MediaQuery.textScalerOf(
                            context,
                          ).scale(17),
                          fontWeight: FontWeight.bold,
                        ),
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
              title: 'Pick-Up Date',
              widget: Text(
                "${booking.startDate.day.toString().padLeft(2, '0')}.${booking.startDate.month.toString().padLeft(2, '0')}.${booking.startDate.year}",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.textScalerOf(context).scale(17),
                ),
              ),
            ),
            const SizedBox(height: 10),
            _BookingInformation(
              title: 'Return Date',
              widget: Text(
                "${booking.endDate.day.toString().padLeft(2, '0')}.${booking.endDate.month.toString().padLeft(2, '0')}.${booking.endDate.year}",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.textScalerOf(context).scale(17),
                ),
              ),
            ),
            const SizedBox(height: 13),
            const Divider(),
            const SizedBox(height: 13),
            _BookingInformation(
              title: 'Total price',
              widget: Text(
                '\$${booking.totalPrice}',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.textScalerOf(context).scale(17),
                ),
              ),
            ),
            const SizedBox(height: 10),
            _BookingInformation(
              title: 'Status',
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
