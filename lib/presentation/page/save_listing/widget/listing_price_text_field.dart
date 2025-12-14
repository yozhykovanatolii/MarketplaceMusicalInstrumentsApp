import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_text_field.dart';
import 'package:marketplace_musical_instruments_app/core/localization/generated/l10n.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/save_listing/save_listing_cubit.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/save_listing/save_listing_state.dart';

class ListingPriceTextField extends StatelessWidget {
  final TextEditingController? controller;

  const ListingPriceTextField({
    super.key,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SaveListingCubit, SaveListingState, String?>(
      selector: (state) => state.priceError,
      builder: (context, priceError) {
        return CommonTextField(
          controller: controller,
          onChanged: (priceText) =>
              context.read<SaveListingCubit>().onPriceChanged(priceText),
          hintText: S.of(context).enterPriceOfTheRentByHours,
          errorText: priceError,
        );
      },
    );
  }
}
