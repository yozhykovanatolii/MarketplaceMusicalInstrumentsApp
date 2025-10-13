import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_button.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/add_and_edit_listing/add_and_edit_listing_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/review/review_bloc.dart';

class AddReviewActionButton extends StatelessWidget {
  const AddReviewActionButton({super.key});

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
