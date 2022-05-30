import 'package:flutter/material.dart';
import 'package:maqw/widget/navigationbottom.dart';
import 'package:maqw/widget/scrollContinerIcon.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: ScrollContinerIcon(),

        ),
      ),

    bottomNavigationBar: NavigationB(),
    );
  }

}
