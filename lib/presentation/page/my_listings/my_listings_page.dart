import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketplace_musical_instruments_app/core/navigation/app_routes.dart';
import 'package:marketplace_musical_instruments_app/core/util/ui_helper.dart';
import 'package:marketplace_musical_instruments_app/core/localization/generated/l10n.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/app/app_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/app/app_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/my_listings/widget/listings_section.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/my_listings/widget/requests_section.dart';

class MyListingsPage extends StatelessWidget {
  const MyListingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).myListings),
          bottom: TabBar(
            tabs: [
              Tab(text: S.of(context).listings),
              Tab(text: S.of(context).requests),
            ],
          ),
        ),
        body: BlocListener<AppBloc, AppState>(
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
          child: const SafeArea(
            minimum: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: TabBarView(
              children: [
                ListingsSection(),
                RequestsSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
