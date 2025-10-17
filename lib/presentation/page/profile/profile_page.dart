import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/edit_profile/edit_profile_page.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/my_bookings/my_bookings_page.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/my_listings/my_listings_page.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/profile/widget/logout_modal_sheet.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/profile/widget/section_list_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 120,
              width: 120,
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/test.jpg',
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Yozhykov Andrey',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView(
                children: [
                  SectionListTile(
                    leadingIcon: Iconsax.user,
                    title: 'Your profile',
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
                    title: 'My Listings',
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
                    title: 'My Bookings',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const MyBookingsPage(),
                        ),
                      );
                    },
                  ),
                  const SectionListTile(
                    leadingIcon: Iconsax.setting_2,
                    title: 'Settings',
                  ),
                  SectionListTile(
                    leadingIcon: Iconsax.logout,
                    title: 'Logout',
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
