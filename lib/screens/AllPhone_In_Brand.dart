import 'package:flutter/material.dart';
import '../main.dart';
import 'Colors.dart';
import 'ContactUs.dart';
import 'Compartion.dart';
import 'PagePhone.dart';

class allPhone_in_brand extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return allPhone_in_brandState();
  }
}

class allPhone_in_brandState extends State<allPhone_in_brand> {
  Widget viewphone(String brand, String name, String phonepictuer) {
    return Container(
      width: 150,
      height: 250,
      padding: EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Bluecolor),
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(color: Greycolor, blurRadius: 4.0, offset: Offset(0, 3)),
          BoxShadow(color: Bluecolor, offset: Offset(-2, 0)),
          BoxShadow(color: Bluecolor, offset: Offset(1, 0)),
          BoxShadow(color: Bluecolor, offset: Offset(0, -0.5)),
        ],
        gradient: LinearGradient(
          colors: [Bluecolor, Bluecolor.withOpacity(0.5)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              alignment: AlignmentDirectional.topStart,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.compare_arrows),
                iconSize: 25,
                color: w,
              )),
          Container(height: 130, width: 130, child: Image.asset(phonepictuer)),
          SizedBox(
            height: 15,
          ),
          Text(
            name,
            style: TextStyle(fontSize: 15, color: w),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            brand,
            style: TextStyle(
              fontSize: 12,
              color: w,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Bluecolor,
        title: Text(
          'Brand',
          style: TextStyle(color: w),
        ),
      ),
      body: ListView(scrollDirection: Axis.vertical, children: [
      Container(
      padding: EdgeInsets.only(top: 15, left: 15, right: 1),
      color: w,
      child: Column(children: [
      Row(
      children: [
      viewphone('brand', 'name', 'assets/images/compartion/screen (1).png'),
      SizedBox(width: 30,),
      viewphone('brand', 'name', 'assets/images/compartion/screen (1).png')
      ],
    ),
    SizedBox(height: 30,),
    Row(
    children: [
    viewphone('brand', 'name', 'assets/images/compartion/screen (1).png'),
      SizedBox(width: 30,),
    viewphone('brand', 'name', 'assets/images/compartion/screen (1).png')
    ],),
        SizedBox(height: 30,),
        Row(
          children: [
            viewphone('brand', 'name', 'assets/images/compartion/screen (1).png'),
            SizedBox(width: 30,),
            viewphone('brand', 'name', 'assets/images/compartion/screen (1).png')
          ],),
        SizedBox(height: 30,),
        Row(
          children: [
            viewphone('brand', 'name', 'assets/images/compartion/screen (1).png'),
            SizedBox(width: 30,),
            viewphone('brand', 'name', 'assets/images/compartion/screen (1).png')
          ],),

    ]),
    )
    ]),
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
                onTap: () {}
              ),
              ListTile(
                title: Text(
                  "All Phone",
                  style: TextStyle(fontSize: 25, color: Bluecolor),
                ),
                trailing: Icon(Icons.phone_android_rounded),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                  "Compartion",
                  style: TextStyle(fontSize: 25, color: Bluecolor),
                ),
                trailing: Icon(Icons.phonelink_setup),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                  "Contact Us",
                  style: TextStyle(fontSize: 25, color: Bluecolor),
                ),
                trailing: Icon(Icons.email_outlined),
                onTap: (){},
              ),
              ListTile(
                title: Text(
                  "Map",
                  style: TextStyle(fontSize: 25, color: Bluecolor),
                ),
                trailing: Icon(Icons.location_searching_outlined),
                onTap: () {},
              ),
            ],
          ) // contact_Us(),
      ),
    );
  }
}
