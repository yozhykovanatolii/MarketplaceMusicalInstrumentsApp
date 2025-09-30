import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:marketplace_musical_instruments_app/core/widget/delete_dialog_box.dart';

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
          builder: (context) => DeleteDialogBox(
            listingId: listingId,
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
