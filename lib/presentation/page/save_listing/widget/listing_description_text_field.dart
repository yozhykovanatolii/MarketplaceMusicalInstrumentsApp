import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_description_text_field.dart';
import 'package:marketplace_musical_instruments_app/core/localization/generated/l10n.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/save_listing/save_listing_cubit.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/save_listing/save_listing_state.dart';

class ListingDescriptionTextField extends StatelessWidget {
  final TextEditingController? controller;

  const ListingDescriptionTextField({
    super.key,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SaveListingCubit, SaveListingState>(
      builder: (context, state) {
        return CommonDescriptionTextField(
          controller: controller,
          hintText: S.of(context).enterDescriptionHere,
          onChanged: (description) => context
              .read<SaveListingCubit>()
              .onDescriptionChanged(description),
          errorText: state.descriptionError,
          counterText: state.descriptionCounterText,
        );
      },
    );
  }
}
