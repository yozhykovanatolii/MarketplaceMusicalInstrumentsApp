import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_description_text_field.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/save_listing/save_listing_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/save_listing/save_listing_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/save_listing/save_listing_state.dart';

class ListingDescriptionTextField extends StatelessWidget {
  final TextEditingController? controller;

  const ListingDescriptionTextField({
    super.key,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SaveListingBloc, SaveListingState>(
      builder: (context, state) {
        return CommonDescriptionTextField(
          controller: controller,
          hintText: 'Enter description here...',
          onChanged: (description) => context.read<SaveListingBloc>().add(
            ListingDecriptionChangeEvent(description),
          ),
          errorText: state.descriptionError,
          counterText: state.descriptionCounterText,
        );
      },
    );
  }
}
