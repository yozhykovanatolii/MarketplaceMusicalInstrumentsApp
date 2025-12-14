import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:marketplace_musical_instruments_app/core/navigation/app_routes.dart';
import 'package:marketplace_musical_instruments_app/core/util/ui_helper.dart';
import 'package:marketplace_musical_instruments_app/generated/l10n.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/app/app_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/app/app_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/profile/widget/logout_modal_sheet.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/profile/widget/section_list_tile.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/profile/widget/user_avatar_section.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/profile/widget/user_full_name_section.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
        minimum: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Column(
          children: [
            const UserAvatarSection(),
            const SizedBox(height: 10),
            const UserFullNameSection(),
            const SizedBox(height: 30),
            Expanded(
              child: ListView(
                children: [
                  SectionListTile(
                    leadingIcon: Iconsax.user,
                    title: S.of(context).yourProfile,
                    onTap: () => context.push(AppRoutes.editProfilePage),
                  ),
                  SectionListTile(
                    leadingIcon: Iconsax.note,
                    title: S.of(context).myListings,
                    onTap: () => context.push(AppRoutes.myListingsPage),
                  ),
                  SectionListTile(
                    leadingIcon: Iconsax.document_text_1,
                    title: S.of(context).myBookings,
                    onTap: () => context.push(AppRoutes.myBookingsPage),
                  ),
                  SectionListTile(
                    leadingIcon: Iconsax.setting_2,
                    title: S.of(context).settings,
                    onTap: () => context.push(AppRoutes.settingsPage),
                  ),
                  SectionListTile(
                    leadingIcon: Iconsax.logout,
                    title: S.of(context).logout,
                    isLogOut: true,
                    onTap: () => UiHelper.showModalSheet(
                      context,
                      const LogoutModalSheet(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
