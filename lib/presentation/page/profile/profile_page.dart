import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:marketplace_musical_instruments_app/generated/l10n.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/edit_profile/edit_profile_page.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/my_bookings/my_bookings_page.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/my_listings/my_listings_page.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/profile/widget/logout_modal_sheet.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/profile/widget/section_list_tile.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/profile/widget/user_avatar_section.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/profile/widget/user_full_name_section.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/settings/settings_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).profile,
        ),
      ),
      body: SafeArea(
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const EditProfilePage(),
                        ),
                      );
                    },
                  ),
                  SectionListTile(
                    leadingIcon: Iconsax.note,
                    title: S.of(context).myListings,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const MyListingsPage(),
                        ),
                      );
                    },
                  ),
                  SectionListTile(
                    leadingIcon: Iconsax.document_text_1,
                    title: S.of(context).myBookings,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const MyBookingsPage(),
                        ),
                      );
                    },
                  ),
                  SectionListTile(
                    leadingIcon: Iconsax.setting_2,
                    title: S.of(context).settings,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SettingsPage(),
                        ),
                      );
                    },
                  ),
                  SectionListTile(
                    leadingIcon: Iconsax.logout,
                    title: S.of(context).logout,
                    isLogOut: true,
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        context: context,
                        builder: (_) => const LogoutModalSheet(),
                      );
                    },
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
