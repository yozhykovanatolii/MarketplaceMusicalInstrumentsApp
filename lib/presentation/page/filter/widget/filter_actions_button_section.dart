import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_button.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/listing/listing_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/listing/listing_event.dart';

class FilterActionsButtonSection extends StatelessWidget {
  const FilterActionsButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: AlignmentGeometry.bottomCenter,
        child: Row(
          spacing: 20,
          children: [
            Flexible(
              child: _FilterActionButton(
                text: 'Clear Filter',
                onPressed: () => context.read<ListingBloc>().add(
                  ClearFilterEvent(),
                ),
                isClearButton: true,
              ),
            ),
            Flexible(
              child: _FilterActionButton(
                text: 'Apply',
                onPressed: () {
                  context.read<ListingBloc>().add(
                    ListingFilterEvent(),
                  );
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterActionButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final bool isClearButton;

  const _FilterActionButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isClearButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return CommonButton(
      width: MediaQuery.of(context).size.width / 2,
      onPressed: onPressed,
      color: isClearButton ? Colors.grey[300]! : const Color(0xFF007DFC),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 17,
          color: isClearButton ? const Color(0xFF007DFC) : Colors.white,
        ),
      ),
    );
  }
}
