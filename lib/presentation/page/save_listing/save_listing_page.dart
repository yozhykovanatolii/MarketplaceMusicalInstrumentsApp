import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketplace_musical_instruments_app/core/helper/ui_helper.dart';
import 'package:marketplace_musical_instruments_app/core/navigation/app_routes.dart';
import 'package:marketplace_musical_instruments_app/domain/entity/listing_entity.dart';
import 'package:marketplace_musical_instruments_app/generated/l10n.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/app/app_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/app/app_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/save_listing/save_listing_cubit.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/save_listing/save_listing_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/save_listing/widget/category_dropdown_menu.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/save_listing/widget/listing_description_text_field.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/save_listing/widget/listing_price_text_field.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/save_listing/widget/listing_save_button.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/save_listing/widget/listing_title_text_field.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/save_listing/widget/mini_google_map.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/save_listing/widget/photo_list_view.dart';

class SaveListingPage extends StatefulWidget {
  final ListingEntity? listing;

  const SaveListingPage({
    super.key,
    this.listing,
  });

  @override
  State<SaveListingPage> createState() => _SaveListingPageState();
}

class _SaveListingPageState extends State<SaveListingPage> {
  late final SaveListingCubit cubit;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceTextController = TextEditingController();

  @override
  void initState() {
    cubit = context.read<SaveListingCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cubit.onEditListing(widget.listing);
      _titleController.text = widget.listing?.title ?? '';
      _descriptionController.text = widget.listing?.description ?? '';
      _priceTextController.text = widget.listing?.priceByHour.toString() ?? '';
    });
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _priceTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).createYourListing,
        ),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<AppBloc, AppState>(
            listener: (context, state) {
              if (state is UserUnauthenticatedState) {
                UiHelper.showSnackBar(
                  context: context,
                  message: state.errorMessage,
                  isErrorSnackBar: true,
                );
                context.go(AppRoutes.loginPage);
              }
            },
          ),
          BlocListener<SaveListingCubit, SaveListingState>(
            listener: (context, state) {
              if (state.errorMessage.isNotEmpty) {
                UiHelper.showSnackBar(
                  context: context,
                  message: state.errorMessage,
                  isErrorSnackBar: true,
                );
              }
              if (state.formStatus == FormStatus.success) {
                UiHelper.showSnackBar(
                  context: context,
                  message: S.of(context).successfulSaveListing,
                );
                if (widget.listing != null) Navigator.pop(context);
              }
            },
          ),
        ],
        child: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).addPhotoOfInstrument,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  S.of(context).selectSeveralPhotosOfTheToolTheFirstPhotoWill,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 10),
                const PhotoListView(),
                const SizedBox(height: 20),
                Text(
                  S.of(context).title,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 5),
                ListingTitleTextField(
                  controller: _titleController,
                ),
                const SizedBox(height: 20),
                Text(
                  S.of(context).description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 5),
                ListingDescriptionTextField(
                  controller: _descriptionController,
                ),
                const SizedBox(height: 20),
                Text(
                  S.of(context).price,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 5),
                ListingPriceTextField(
                  controller: _priceTextController,
                ),
                const SizedBox(height: 20),
                Text(
                  S.of(context).category,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  S
                      .of(context)
                      .selectTheCategoryToWhichTheMusicalInstrumentWillBelong,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 10),
                const CategoryDropdownMenu(),
                const SizedBox(height: 20),
                Text(
                  S.of(context).location,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  S.of(context).clickTheButtonToGetYourCurrentLocation,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 10),
                const MiniGoogleMap(),
                const SizedBox(height: 30),
                ListingSaveButton(
                  listing: widget.listing,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
