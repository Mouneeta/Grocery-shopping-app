import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GNav(tabs: [
    GButton(
      icon: Icons.home_outlined,
      iconColor: Colors.grey,
      //text: 'home',
      //textColor: Colors.white10,
        ),
      GButton(
        icon: Icons.category_outlined,
        iconColor: Colors.grey,
        //text: 'Shop',
      ),
      GButton(
        icon: Icons.search,
        iconColor: Colors.grey,
        //text: 'Shop',
      ),
      GButton(
        icon: Icons.supervisor_account,
        iconColor: Colors.grey,
        //text: 'Shop',
      ),
      GButton(
        icon: Icons.more_vert_rounded,
        iconColor: Colors.grey,
        //text: 'Shop',
      ),
      ],
    );
  }
}
