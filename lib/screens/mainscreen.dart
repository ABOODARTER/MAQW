import 'package:flutter/material.dart';
import 'package:maqw/widget/maincomparison.dart';
import 'package:maqw/widget/mainmap.dart';
import 'package:maqw/widget/navigationbottom.dart';
import 'package:maqw/widget/scrollContinerIcon.dart';

import '../main.dart';
import '../widget/mainphones.dart';
import 'AllPhone.dart';
import 'Colors.dart';
import 'Compartion.dart';
import 'ContactUs.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController controller = PageController();

  void selectScreen(BuildContext ctx, String s ) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      if (s == "ContatUs")
        return contact_Us();
      else if (s == 'Compartion')
        return compartion();
      else if (s == "allphone")
        return allPhone();
      else
        return MainScreen ();
    }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
        body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ScrollContinerIcon(),
                  SizedBox(height: 30,),
                  MainPhones(),
                  SizedBox(height: 30,),
                  MainComparison(),
                  SizedBox(height: 30,),
                  MainMap(),

                ],
              ),

            ),
      ),
      //list in appbar
      drawerScrimColor: Colors.black.withOpacity(0.4),
      drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                title: Text(
                  'MAQW MOBIL ^_^',
                  style: TextStyle(fontSize: 40, color: Bluecolor),
                ),
              ),
              ListTile(
                title: Text(
                  "Home",
                  style: TextStyle(fontSize: 25, color: Bluecolor),
                ),
                trailing: Icon(Icons.home),
                onTap: () => selectScreen(context, "home"),
              ),
              ListTile(
                title: Text(
                  "All Phone",
                  style: TextStyle(fontSize: 25, color: Bluecolor),
                ),
                trailing: Icon(Icons.phone_android_rounded),
                onTap: () => selectScreen(context, "allphone"),
              ),
              ListTile(
                title: Text(
                  "Compartion",
                  style: TextStyle(fontSize: 25, color: Bluecolor),
                ),
                trailing: Icon(Icons.phonelink_setup),
                onTap: () => selectScreen(context, "Compartion"),
              ),
              ListTile(
                title: Text(
                  "Contact Us",
                  style: TextStyle(fontSize: 25, color: Bluecolor),
                ),
                trailing: Icon(Icons.email_outlined),
                onTap: () => selectScreen(context, "ContatUs"),
              ),
            ],
          ) // contact_Us(),
      ),

    bottomNavigationBar: NavigationB(),
    );
  }

}
