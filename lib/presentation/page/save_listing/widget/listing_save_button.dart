import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_button.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_progress_indicator.dart';
import 'package:marketplace_musical_instruments_app/data/model/listing_model.dart';
import 'package:marketplace_musical_instruments_app/generated/l10n.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/save_listing/save_listing_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/save_listing/save_listing_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/save_listing/save_listing_state.dart';

class ListingSaveButton extends StatelessWidget {
  final ListingModel? listing;

  const ListingSaveButton({
    super.key,
    required this.listing,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SaveListingBloc, SaveListingState>(
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
                S.of(context).save,
                style: TextStyle(
                  color: textColor,
                  fontSize: 18,
                ),
              );
        final onPressed = buttonStatus == ButtonStatus.disabled
            ? null
            : () => context.read<SaveListingBloc>().add(
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
