import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_text_field.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/add_and_edit_listing/add_and_edit_listing_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/add_and_edit_listing/add_and_edit_listing_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/add_and_edit_listing/add_and_edit_listing_state.dart';

class ListingTitleTextField extends StatelessWidget {
  final TextEditingController? controller;

  const ListingTitleTextField({
    super.key,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAndEditListingBloc, AddAndEditListingState>(
      builder: (context, state) {
        return CommonTextField(
          controller: controller,
          onChanged: (title) => context.read<AddAndEditListingBloc>().add(
            ListingTitleChangeEvent(title),
          ),
          hintText: 'Enter name of the instrument',
          errorText: state.titleError,
          counterText: state.titleCounterText,
        );
      },
    );
  }
}
