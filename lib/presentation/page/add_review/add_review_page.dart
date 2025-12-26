import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/localization/generated/l10n.dart';
import 'package:marketplace_musical_instruments_app/core/state/form_status.dart';
import 'package:marketplace_musical_instruments_app/core/util/ui_helper.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/review/review_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/review/review_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/add_review/widget/add_review_action_button.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/add_review/widget/average_rating_bar.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/add_review/widget/review_text_field.dart';

class AddReviewPage extends StatelessWidget {
  final String listingId;
  final double rating;
  final int reviewerCounter;

  const AddReviewPage({
    super.key,
    required this.listingId,
    required this.rating,
    required this.reviewerCounter,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReviewBloc, ReviewState>(
      listener: (context, state) {
        final formStatus = state.formStatus;
        if (formStatus == FormStatus.success) {
          UiHelper.showSnackBar(
            context: context,
            message: 'The review has been added',
          );
          Navigator.of(context).pop();
        }
        if (formStatus == FormStatus.failure) {
          UiHelper.showSnackBar(
            context: context,
            message: state.errorText,
            isErrorSnackBar: true,
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: const EdgeInsets.only(top: 320),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(
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
                  S.of(context).leaveAReview,
                  style: TextStyle(
                    fontSize: MediaQuery.textScalerOf(context).scale(24),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                S.of(context).yourOverallRating,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 10),
              const AverageRatingBar(),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 15),
              Text(
                S.of(context).addDetailedReview,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 10),
              const ReviewTextField(),
              const SizedBox(height: 10),
              AddReviewActionButton(
                listingId: listingId,
                rating: rating,
                reviewerCounter: reviewerCounter,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
