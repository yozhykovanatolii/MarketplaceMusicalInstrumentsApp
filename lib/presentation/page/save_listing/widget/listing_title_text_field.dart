import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_text_field.dart';
import 'package:marketplace_musical_instruments_app/generated/l10n.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/save_listing/save_listing_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/save_listing/save_listing_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/save_listing/save_listing_state.dart';

class ListingTitleTextField extends StatelessWidget {
  final TextEditingController? controller;

  const ListingTitleTextField({
    super.key,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SaveListingBloc, SaveListingState>(
      builder: (context, state) {
        return CommonTextField(
          controller: controller,
          onChanged: (title) => context.read<SaveListingBloc>().add(
            ListingTitleChangeEvent(title),
          ),
          hintText: S.of(context).enterNameOfTheInstrument,
          errorText: state.titleError,
          counterText: state.titleCounterText,
        );
      },
    );
  }
}
