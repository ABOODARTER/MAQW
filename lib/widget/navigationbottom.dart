import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../main.dart';

class NavigationB extends StatefulWidget {
  const NavigationB({Key? key}) : super(key: key);

  @override
  State<NavigationB> createState() => _NavigationBState();
}

class _NavigationBState extends State<NavigationB> {
  int _index=0;

  @override
  Widget build(BuildContext context) {
    List tabs= [
      GButton(
        icon: Icons.home,
        text: "Home",
        onPressed: () =>
            Navigator.of(context).pushReplacementNamed('mainscreen'),
      ),
      GButton(
        icon: Icons.phone_android,
        text: "All phone",
        onPressed: ()=>Navigator.of(context).pushReplacementNamed('allphone'),
      ),
      GButton(
        icon: Icons.compare,
        text: "Comparison",
        onPressed: ()=>Navigator.of(context).pushReplacementNamed('compartion'),
      ),
      GButton(
          icon: Icons.settings,
          text: "Settings",
          onPressed: ()=>Navigator.of(context).pushReplacementNamed('contact_us')
      ),
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: GNav(
        gap: 8,
        color: Colors.grey,
        activeColor: Colors.white,
        tabBackgroundColor: bluee,

        padding: EdgeInsets.all(16),
        onTabChange: (index) {
setState(() {
  _index=index;
});

        },
        selectedIndex: _index,
        tabs: [tabs[0],tabs[1],tabs[2],tabs[3],],

      ),
    );
  }
}
