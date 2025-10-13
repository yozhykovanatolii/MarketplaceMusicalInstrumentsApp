import 'package:flutter/material.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/add_review/widget/add_review_action_button.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/add_review/widget/average_rating_bar.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/add_review/widget/review_text_field.dart';

class AddReviewPage extends StatelessWidget {
  const AddReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.only(top: 320),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Center(
              child: Text(
                'Leave a Review',
                style: TextStyle(
                  fontSize: MediaQuery.textScalerOf(context).scale(24),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'Your overall rating',
              style: TextStyle(
                fontSize: MediaQuery.textScalerOf(context).scale(20),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            const AverageRatingBar(),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 15),
            Text(
              'Add detailed review',
              style: TextStyle(
                fontSize: MediaQuery.textScalerOf(context).scale(20),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            const ReviewTextField(),
            const SizedBox(height: 10),
            const AddReviewActionButton(),
          ],
        ),
      ),
    );
  }
}
