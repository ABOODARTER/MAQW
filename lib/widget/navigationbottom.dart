import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../main.dart';

class NavigationB extends StatefulWidget {
  const NavigationB({Key? key}) : super(key: key);

  @override
  State<NavigationB> createState() => _NavigationBState();
}

class _NavigationBState extends State<NavigationB> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
        child: GNav(
          gap: 8,
          color: Colors.grey,
          activeColor: Colors.white,
          tabBackgroundColor: bluee,
          padding: EdgeInsets.all(16),
          onTabChange: (index){

          },
          tabs: [
            GButton(icon:Icons.home,text: "Home",),
            GButton(icon:Icons.phone_android,text: "All phone",),
            GButton(icon:Icons.compare,text: "Comparison",),
            GButton(icon:Icons.settings,text: "Settings",),
          ],
        ),
    );

  }
}
