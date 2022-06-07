import 'package:flutter/material.dart';
import 'package:maqw/widget/maincomparison.dart';
import 'package:maqw/widget/mainmap.dart';
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
      appBar: AppBar(
        title:const Text("main screen"),
        centerTitle: true,
      ),
        body: SafeArea(
          child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children:const[
                ScrollContinerIcon(),
                SizedBox(height: 30,),
                MainComparison(),
                SizedBox(height: 30,),
                MainMap()
              ],
            ),

          ),
      ),
        ),

    bottomNavigationBar:const NavigationB(),
    );
  }

}
