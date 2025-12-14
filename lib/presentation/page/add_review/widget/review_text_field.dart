import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_description_text_field.dart';
import 'package:marketplace_musical_instruments_app/core/localization/generated/l10n.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/review/review_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/review/review_event.dart';

class ReviewTextField extends StatelessWidget {
  const ReviewTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final conterReviewText = context.select(
      (ReviewBloc bloc) => bloc.state.counterReviewText,
    );
    final reviewTextError = context.select(
      (ReviewBloc bloc) => bloc.state.reviewTextError,
    );
    return CommonDescriptionTextField(
      onChanged: (reviewText) => context.read<ReviewBloc>().add(
        ReviewTextChangeEvent(reviewText),
      ),
      hintText: S.of(context).enterHere,
      errorText: reviewTextError,
      counterText: conterReviewText,
    );
  }
}
