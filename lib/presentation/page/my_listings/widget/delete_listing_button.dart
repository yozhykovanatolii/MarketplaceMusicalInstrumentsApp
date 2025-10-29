import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:marketplace_musical_instruments_app/core/widget/information_dialog_box.dart';
import 'package:marketplace_musical_instruments_app/generated/l10n.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/author_listing/author_listing_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/author_listing/author_listing_event.dart';

class DeleteListingButton extends StatelessWidget {
  final String listingId;

  const DeleteListingButton({
    super.key,
    required this.listingId,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => InformationDialogBox(
            title: S.of(context).deleteListing,
            description: S.of(context).youreGoingToDeleteYourListingAreYouSure,
            onClickActionButton: () {
              context.read<AuthorListingBloc>().add(
                AuthorListingDeleteEvent(listingId),
              );
              Navigator.of(context).pop();
            },
          ),
        );
      },
      style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.white),
      ),
      icon: const Icon(
        Iconsax.trash,
        color: Colors.red,
      ),
    );
  }
}
