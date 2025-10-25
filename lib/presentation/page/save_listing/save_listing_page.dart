import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/util/snack_bar_util.dart';
import 'package:marketplace_musical_instruments_app/data/model/listing_model.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/save_listing/save_listing_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/save_listing/save_listing_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/save_listing/save_listing_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/save_listing/widget/category_dropdown_menu.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/save_listing/widget/listing_description_text_field.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/save_listing/widget/listing_price_text_field.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/save_listing/widget/listing_save_button.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/save_listing/widget/listing_title_text_field.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/save_listing/widget/mini_google_map.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/save_listing/widget/photo_list_view.dart';

class AddAndEditInstrumentPage extends StatefulWidget {
  final ListingModel? listing;

  const AddAndEditInstrumentPage({
    super.key,
    this.listing,
  });

  @override
  State<AddAndEditInstrumentPage> createState() =>
      _AddAndEditInstrumentPageState();
}

class _AddAndEditInstrumentPageState extends State<AddAndEditInstrumentPage> {
  late final SaveListingBloc bloc;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceTextController = TextEditingController();

  @override
  void initState() {
    bloc = context.read<SaveListingBloc>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bloc.add(ListingEditEvent(widget.listing));
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
        title: const Text(
          'Create your listing',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocListener<SaveListingBloc, SaveListingState>(
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
            if (widget.listing != null) Navigator.pop(context);
          }
        },
        child: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                const PhotoListView(),
                const SizedBox(height: 20),
                const Text(
                  'Title',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                ListingTitleTextField(
                  controller: _titleController,
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
                ListingDescriptionTextField(
                  controller: _descriptionController,
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
                ListingPriceTextField(
                  controller: _priceTextController,
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
