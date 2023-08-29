import 'package:flutter/material.dart';
import 'package:food_app/CartPage.dart';

import 'HomePage.dart';
import 'ProfilePage.dart';
import 'gnavbar.dart';

class SwitchPages extends StatefulWidget {
  const SwitchPages({super.key});

  @override
  State<SwitchPages> createState() => _SwitchPAgesState();
}

class _SwitchPAgesState extends State<SwitchPages> {
  int _selectedIndex = 0;

  void Change(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> pages = [HomePage(), CartPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: GNavBar(onTabChange: (index) => Change(index)),
      body: pages[_selectedIndex],
    );
  }
}
