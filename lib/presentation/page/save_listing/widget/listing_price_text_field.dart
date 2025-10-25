import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_text_field.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/add_and_edit_listing/add_and_edit_listing_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/add_and_edit_listing/add_and_edit_listing_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/add_and_edit_listing/add_and_edit_listing_state.dart';

class ListingPriceTextField extends StatelessWidget {
  final TextEditingController? controller;

  const ListingPriceTextField({
    super.key,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AddAndEditListingBloc, AddAndEditListingState, String?>(
      selector: (state) => state.priceError,
      builder: (context, priceError) {
        return CommonTextField(
          controller: controller,
          onChanged: (priceText) => context.read<AddAndEditListingBloc>().add(
            ListingPriceChangeEvent(priceText),
          ),
          hintText: 'Enter price of the rent by hours',
          errorText: priceError,
        );
      },
    );
  }
}
