import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return SizedBox(
      height: 100,
      child: TextField(
        onChanged: (reviewText) {
          context.read<ReviewBloc>().add(
            ReviewTextChangeEvent(reviewText),
          );
        },
        maxLines: null,
        minLines: 5,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFFAFAFA),
          hintText: 'Enter here..',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 2.5,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding: const EdgeInsets.all(10),
          errorText: reviewTextError,
          counterText: conterReviewText,
        ),
      ),
    );
  }
}
