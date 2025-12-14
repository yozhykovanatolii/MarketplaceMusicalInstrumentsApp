import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketplace_musical_instruments_app/core/navigation/app_routes.dart';
import 'package:marketplace_musical_instruments_app/core/util/ui_helper.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_progress_indicator.dart';
import 'package:marketplace_musical_instruments_app/core/widget/listings_grid_view.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/app/app_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/app/app_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/favourite_listings/favourite_listings_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/favourite_listings/favourite_listings_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/favourite_listings/favourite_listings_state.dart';

class FavouriteListingsPage extends StatefulWidget {
  const FavouriteListingsPage({super.key});

  @override
  State<FavouriteListingsPage> createState() => _FavouriteListingsPageState();
}

class _FavouriteListingsPageState extends State<FavouriteListingsPage> {
  @override
  void initState() {
    context.read<FavouriteListingsBloc>().add(
      FavouriteListingsFetchEvent(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState>(
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
      child: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: BlocBuilder<FavouriteListingsBloc, FavouriteListingsState>(
          builder: (context, state) {
            final status = state.status;
            if (status == FavouriteListingsStatus.failure) {
              return Center(
                child: Text(
                  state.errorMessage,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              );
            }
            if (status == FavouriteListingsStatus.success) {
              final favouriteListings = state.favouriteListings;
              return ListingsGridView(
                listings: favouriteListings,
                isEditingListings: false,
              );
            }
            return const Center(
              child: CommonProgressIndicator(
                scale: 1.08,
                color: Colors.blue,
              ),
            );
          },
        ),
      ),
    );
  }
}
