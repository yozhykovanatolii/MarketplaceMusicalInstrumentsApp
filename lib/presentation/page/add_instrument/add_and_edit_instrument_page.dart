import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:marketplace_musical_instruments_app/core/util/snack_bar_util.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_button.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_progress_indicator.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_text_field.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/add_and_edit_listing/add_and_edit_listing_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/add_and_edit_listing/add_and_edit_listing_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/add_and_edit_listing/add_and_edit_listing_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/add_instrument/widget/category_dropdown_menu.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/add_instrument/widget/description_text_field.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/add_instrument/widget/mini_google_map.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/add_instrument/widget/photo_list_view.dart';

class AddAndEditInstrumentPage extends StatelessWidget {
  const AddAndEditInstrumentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AddAndEditListingBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create your listing',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
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
          if (state.formStatus == FormStatus.success) {
            SnackBarUtil.showSnackBar(
              context,
              'Successful save listing',
              Icons.check_circle,
              0xFFD4FFFE,
              0xFF009688,
            );
          }
        },
        child: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Add photo of instrument',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Select several photos of the tool. The first photo will be on the listing cover.',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: const PhotoListView(),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Title',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                BlocBuilder<AddAndEditListingBloc, AddAndEditListingState>(
                  builder: (context, state) {
                    return CommonTextField(
                      onChanged: (title) => bloc.add(
                        ListingTitleChangeEvent(title),
                      ),
                      prefixIcon: Iconsax.box,
                      hintText: 'Enter name of the instrument',
                      errorText: state.titleError,
                      counterText: state.titleCounterText,
                    );
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                BlocBuilder<AddAndEditListingBloc, AddAndEditListingState>(
                  builder: (context, state) {
                    return DescriptionTextField(
                      onChanged: (description) => bloc.add(
                        ListingDecriptionChangeEvent(description),
                      ),
                      errorText: state.descriptionError,
                      counterText: state.descriptionCounterText,
                    );
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Price',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                BlocSelector<
                  AddAndEditListingBloc,
                  AddAndEditListingState,
                  String?
                >(
                  selector: (state) => state.priceError,
                  builder: (context, priceError) {
                    return CommonTextField(
                      onChanged: (priceText) => bloc.add(
                        ListingPriceChangeEvent(priceText),
                      ),
                      prefixIcon: Iconsax.tag,
                      hintText: 'Enter price of the rent by hours',
                      errorText: priceError,
                    );
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Category',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Select the category to which the musical instrument will belong.',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 10),
                const CategoryDropdownMenu(),
                const SizedBox(height: 20),
                const Text(
                  'Location',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Click the button to get your current location.',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 10),
                const MiniGoogleMap(),
                const SizedBox(height: 30),
                BlocBuilder<AddAndEditListingBloc, AddAndEditListingState>(
                  builder: (context, state) {
                    final buttonStatus = state.buttonStatus;
                    final formStatus = state.formStatus;
                    final color = buttonStatus == ButtonStatus.disabled
                        ? Colors.grey
                        : Colors.blue;
                    final textColor = buttonStatus == ButtonStatus.disabled
                        ? Colors.black
                        : Colors.white;
                    final child = formStatus == FormStatus.loading
                        ? const CommonProgressIndicator(scale: 0.8)
                        : Text(
                            'Save',
                            style: TextStyle(
                              color: textColor,
                              fontSize: 18,
                            ),
                          );
                    final onPressed = buttonStatus == ButtonStatus.disabled
                        ? null
                        : () => bloc.add(ListingSaveEvent());
                    return CommonButton(
                      onPressed: onPressed,
                      color: color,
                      child: child,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
