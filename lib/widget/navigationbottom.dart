import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../main.dart';

class NavigationB extends StatefulWidget {
  const NavigationB({Key? key}) : super(key: key);

  @override
  State<NavigationB> createState() => _NavigationBState();
}

class _NavigationBState extends State<NavigationB> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: GNav(
        selectedIndex: _index,
        gap: 8,
        color: Colors.grey,
        activeColor: Colors.white,
        tabBackgroundColor: bluee,
        padding: const EdgeInsets.all(16),
        duration: Duration(milliseconds: 400),
        curve: Curves.easeOutExpo,
        haptic: true,
        tabBorderRadius: 25,
        onTabChange: (index) {
          if (mounted) {
            setState(() {
              _index = index;
              print("${_index}");
            });
          }
        },
        tabs: [
          GButton(
            icon: Icons.home,
            text: "Home",
            onPressed: () async =>
                await Navigator.of(context).pushNamed('mainscreen'),
          ),
          GButton(
            icon: Icons.phone_android,
            text: "All phone",
            onPressed: () async =>
                await Navigator.of(context).pushNamed('allphone'),
          ),
          GButton(
            icon: Icons.compare,
            text: "Comparison",
            onPressed: () async =>
                await Navigator.of(context).pushNamed('compartion'),
          ),
          GButton(
              icon: Icons.settings,
              text: "Settings",
              onPressed: () async =>
                  await Navigator.of(context).pushNamed('contact_us')),
        ],
      ),
    );
  }
}
