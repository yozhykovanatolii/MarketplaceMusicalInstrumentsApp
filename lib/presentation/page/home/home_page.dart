import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:marketplace_musical_instruments_app/core/helper/ui_helper.dart';
import 'package:marketplace_musical_instruments_app/core/navigation/app_routes.dart';
import 'package:marketplace_musical_instruments_app/core/widget/get_user_location_button.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/app/app_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/app/app_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/listing/listing_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/listing/listing_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/listing/state/listing_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/home/widget/filter_floating_action_button.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/home/widget/google_map_section.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/home/widget/listings_drawable_sheet.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/home/widget/text_search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AppBloc, AppState>(
        listener: (context, state) {
          if (state is UserUnauthenticatedState) {
            UiHelper.showSnackBar(
              context,
              state.errorMessage,
              Icons.error,
              0xFFFFEEEF,
              0xFFE77282,
            );
            context.go(AppRoutes.loginPage);
          }
        },
        child: SafeArea(
          child: Stack(
            children: [
              BlocSelector<ListingBloc, ListingState, Map<String, double>>(
                selector: (state) => state.location,
                builder: (context, location) {
                  return GoogleMapSection(
                    currentLocation: LatLng(
                      location['latitude']!,
                      location['longitude']!,
                    ),
                  );
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
                child: Row(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: TextSearchBar(),
                    ),
                    FilterFloatingActionButton(),
                  ],
                ),
              ),
              Positioned(
                bottom: 175,
                right: 15,
                child: GetUserLocationButton(
                  onPressed: () => context.read<ListingBloc>().add(
                    ListingInitializeEvent(),
                  ),
                ),
              ),
              const ListingsDrawableSheet(),
            ],
          ),
        ),
      ),
    );
  }
}
