import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_button.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/add_and_edit_listing/add_and_edit_listing_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/review/review_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/review/review_event.dart';

class AddReviewActionButton extends StatelessWidget {
  final String listingId;
  final double rating;
  final int reviewerCounter;

  const AddReviewActionButton({
    super.key,
    required this.listingId,
    required this.rating,
    required this.reviewerCounter,
  });

  @override
  Widget build(BuildContext context) {
    final buttonStatus = context.select(
      (ReviewBloc bloc) => bloc.state.buttonStatus,
    );
    final color = buttonStatus == ButtonStatus.disabled
        ? Colors.grey
        : const Color(0xFF007DFC);
    final textColor = buttonStatus == ButtonStatus.disabled
        ? Colors.black
        : Colors.white;
    return Expanded(
      child: Align(
        alignment: AlignmentGeometry.bottomCenter,
        child: CommonButton(
          width: double.infinity,
          onPressed: () {
            context.read<ReviewBloc>().add(
              AddReviewEvent(
                listingId: listingId,
                rating: rating,
                reviewerCounter: reviewerCounter,
              ),
            );
            Navigator.pop(context);
          },
          color: color,
          child: Text(
            'Add Review',
            style: TextStyle(
              fontSize: 17,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
