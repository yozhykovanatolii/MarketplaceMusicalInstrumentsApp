import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/theme/app_colors.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_button.dart';
import 'package:marketplace_musical_instruments_app/core/localization/generated/l10n.dart';
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
                text: S.of(context).clearFilter,
                onPressed: () {
                  context.read<ListingBloc>().add(
                    ClearFilterEvent(),
                  );
                  Navigator.of(context).pop();
                },
                isClearButton: true,
              ),
            ),
            Flexible(
              child: _FilterActionButton(
                text: S.of(context).apply,
                onPressed: () {
                  context.read<ListingBloc>().add(
                    ListingFilterEvent(),
                  );
                  Navigator.of(context).pop();
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
    required this.text,
    required this.onPressed,
    this.isClearButton = false,
  });

  @override
  Widget build(BuildContext context) {
    final blueColor = const Color(AppColors.kBlue);
    return CommonButton(
      width: MediaQuery.of(context).size.width / 2,
      onPressed: onPressed,
      color: isClearButton ? Colors.grey[300]! : blueColor,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 17,
          color: isClearButton ? blueColor : Colors.white,
        ),
      ),
    );
  }
}
