import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_button.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_progress_indicator.dart';
import 'package:marketplace_musical_instruments_app/data/model/listing_model.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/add_and_edit_listing/add_and_edit_listing_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/add_and_edit_listing/add_and_edit_listing_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/add_and_edit_listing/add_and_edit_listing_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_state.dart';

class ListingSaveButton extends StatelessWidget {
  final ListingModel? listing;

  const ListingSaveButton({
    super.key,
    required this.listing,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAndEditListingBloc, AddAndEditListingState>(
      builder: (context, state) {
        final buttonStatus = state.buttonStatus;
        final formStatus = state.formStatus;
        final color = buttonStatus == ButtonStatus.disabled
            ? Colors.grey
            : Colors.blue;
        final textColor = buttonStatus == ButtonStatus.disabled
            ? Colors.black
            : Colors.white;
        final child = formStatus == FormStatus.loading
            ? const CommonProgressIndicator(scale: 0.8)
            : Text(
                'Save',
                style: TextStyle(
                  color: textColor,
                  fontSize: 18,
                ),
              );
        final onPressed = buttonStatus == ButtonStatus.disabled
            ? null
            : () => context.read<AddAndEditListingBloc>().add(
                ListingSaveEvent(listing),
              );
        return CommonButton(
          width: MediaQuery.of(context).size.width,
          onPressed: onPressed,
          color: color,
          child: child,
        );
      },
    );
  }
}
