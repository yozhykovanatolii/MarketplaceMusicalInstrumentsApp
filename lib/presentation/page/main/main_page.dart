import 'package:flutter/material.dart';
import 'package:marketplace_musical_instruments_app/generated/l10n.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/main/widget/bottom_navigation.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/save_listing/save_listing_page.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/favourite_listings/favourite_listings_page.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/home/home_page.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/profile/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  static const _pages = [
    HomePage(),
    FavouriteListingsPage(),
    SaveListingPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (_selectedIndex == 1 || _selectedIndex == 3)
          ? AppBar(
              title: Text(
                _selectedIndex == 1
                    ? S.of(context).favourite
                    : S.of(context).profile,
              ),
            )
          : null,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigation(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
