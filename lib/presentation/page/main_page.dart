import 'package:flutter/material.dart';
import 'package:marketplace_musical_instruments_app/core/widget/bottom_navigation.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/add_instrument/add_and_edit_instrument_page.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/home/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  static const _pages = [
    HomePage(),
    HomePage(),
    AddAndEditInstrumentPage(),
    HomePage(),
    HomePage(),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigation(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
