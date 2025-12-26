import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/state/button_status.dart';
import 'package:marketplace_musical_instruments_app/core/state/form_status.dart';
import 'package:marketplace_musical_instruments_app/core/theme/app_colors.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_button.dart';
import 'package:marketplace_musical_instruments_app/core/localization/generated/l10n.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_progress_indicator.dart';
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
    final formStatus = context.select(
      (ReviewBloc bloc) => bloc.state.formStatus,
    );
    final isButtonDisabled = buttonStatus == ButtonStatus.disabled;
    final child = formStatus == FormStatus.loading
        ? const CommonProgressIndicator(scale: 0.8)
        : Text(
            S.of(context).addReview,
            style: TextStyle(
              fontSize: 17,
              color: isButtonDisabled ? Colors.black : Colors.white,
            ),
          );
    return Expanded(
      child: Align(
        alignment: AlignmentGeometry.bottomCenter,
        child: CommonButton(
          width: double.infinity,
          onPressed: isButtonDisabled ? null : () => _onPressButton(context),
          color: isButtonDisabled ? Colors.grey : const Color(AppColors.kBlue),
          child: child,
        ),
      ),
    );
  }

  void _onPressButton(BuildContext context) {
    context.read<ReviewBloc>().add(
      AddReviewEvent(
        listingId: listingId,
        rating: rating,
        reviewerCounter: reviewerCounter,
      ),
    );
  }
}
