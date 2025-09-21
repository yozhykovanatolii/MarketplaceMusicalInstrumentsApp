import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:marketplace_musical_instruments_app/core/util/snack_bar_util.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_button.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_text_field.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/add_and_edit_listing/add_and_edit_listing_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/add_and_edit_listing/add_and_edit_listing_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/add_instrument/widget/category_dropdown_menu.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/add_instrument/widget/description_text_field.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/add_instrument/widget/mini_google_map.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/add_instrument/widget/photo_list_view.dart';

class AddAndEditInstrumentPage extends StatelessWidget {
  const AddAndEditInstrumentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AddAndEditListingBloc, AddAndEditListingState>(
        listener: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            SnackBarUtil.showSnackBar(
              context,
              state.errorMessage,
              Icons.error,
              0xFFFFEEEF,
              0xFFE77282,
            );
          }
        },
        child: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: const PhotoListView(),
                ),
                const SizedBox(height: 20),
                const CommonTextField(
                  prefixIcon: Iconsax.box,
                  hintText: 'Enter name of the instrument',
                ),
                const SizedBox(height: 20),
                const DescriptionTextField(),
                const SizedBox(height: 20),
                const CommonTextField(
                  prefixIcon: Iconsax.tag,
                  hintText: 'Enter price of the rent by hours',
                ),
                const SizedBox(height: 20),
                const CategoryDropdownMenu(),
                const SizedBox(height: 20),
                const MiniGoogleMap(),
                const SizedBox(height: 30),
                CommonButton(
                  onPressed: () {},
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
