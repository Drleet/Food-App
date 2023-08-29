import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class GNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  GNavBar({super.key, this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return GNav(
      backgroundColor: Color.fromARGB(25, 135, 135, 135),
      hoverColor: Colors.grey[100]!,
      gap: 8,
      activeColor: Colors.white,
      iconSize: 24,
      tabMargin: EdgeInsets.all(8),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      duration: Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      tabBackgroundColor: Color.fromARGB(69, 135, 135, 135),
      color: Color.fromARGB(255, 143, 143, 143),
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      onTabChange: (value) => onTabChange!(value),
      tabs: [
        GButton(
          borderRadius: BorderRadius.circular(15),
          icon: Icons.home_rounded,
          text: 'Home',
        ),
        GButton(
          borderRadius: BorderRadius.circular(15),
          icon: Icons.favorite_rounded,
          text: 'Favourites',
        ),
        GButton(
          borderRadius: BorderRadius.circular(15),
          icon: Icons.person_rounded,
          text: 'profile',
        ),
      ],
    );
  }
}
