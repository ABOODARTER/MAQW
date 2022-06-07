import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:maqw/screens/Compartion.dart';
import 'package:maqw/widget/searchwidget.dart';
import '../main.dart';
import '../screens/AllPhone_In_Brand.dart';
import '../screens/Colors.dart';
import '../screens/Colors.dart';
import '../screens/PagePhone.dart';
import '../screens/salecenter.dart';

class MainPhones extends StatefulWidget {
  const MainPhones({Key? key}) : super(key: key);

  @override
  State<MainPhones> createState() => _MainPhonesState();
}

class _MainPhonesState extends State<MainPhones> {
  Widget Viewphone({
    required CardItem item,
  }) =>
      Container(
        width: 150,
        height: 60,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(color:Bluecolor),
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(color: Greycolor, blurRadius: 4.0, offset: Offset(0, 3)),
            BoxShadow(color: w, offset: Offset(-2, 0)),
            BoxShadow(color: w, offset: Offset(1, 0)),
            BoxShadow(color: w, offset: Offset(0, -0.5)),
          ],
          gradient: LinearGradient(
            colors: [w, w.withOpacity(0.5)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 2 / 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Material(
                    child: Ink.image(
                      image: AssetImage(item.assetImage),
                      fit: BoxFit.cover,
                      child: InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => pagephone(item: item))),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              item.title,
              style: TextStyle(
                  fontSize: 13, fontWeight: FontWeight.bold, color: Bluecolor),
            ),
            RaisedButton(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              color: Bluecolor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => allPhone_in_brand(item: item,))),
              child: Text(
                item.subtitle,
                style: TextStyle(
                    fontSize: 10, color: w, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      );

  //list for cards view phone
  List<CardItem> itemSumsang = [
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Samsung Not 9 pro',
        subtitle: 'Samsung'),
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Samsung Not 9 pro',
        subtitle: 'Samsung'),
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Samsung Not 9 pro',
        subtitle: 'Samsung'),
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Samsung Not 9 pro',
        subtitle: 'Samsung'),
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Samsung Not 9 pro',
        subtitle: 'Samsung'),
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Samsung Not 9 pro',
        subtitle: 'Samsung'),
  ];
  List<CardItem> itemRedmi = [
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Redmi Not 9 pro',
        subtitle: 'Redmi'),
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Redmi Not 9 pro',
        subtitle: 'Redmi'),
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Redmi Not 9 pro',
        subtitle: 'Redmi'),
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Redmi Not 9 pro',
        subtitle: 'Redmi'),
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Redmi Not 9 pro',
        subtitle: 'Redmi'),
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Redmi Not 9 pro',
        subtitle: 'Redmi'),
  ];

  List<CardItem> itemApple = [
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Apple Not 9 pro',
        subtitle: 'Apple'),
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Apple Not 9 pro',
        subtitle: 'Apple'),
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Apple Not 9 pro',
        subtitle: 'Apple'),
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Apple Not 9 pro',
        subtitle: 'Apple'),
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Apple Not 9 pro',
        subtitle: 'Apple'),
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Apple Not 9 pro',
        subtitle: 'Apple'),
  ];

  List<CardItem> itemHuawei = [
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Huawi Not 9 pro',
        subtitle: 'Huawi'),
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Huawi Not 9 pro',
        subtitle: 'Huawi'),
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Huawi Not 9 pro',
        subtitle: 'Huawi'),
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Huawi Not 9 pro',
        subtitle: 'Huawi'),
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Huawi Not 9 pro',
        subtitle: 'Huawi'),
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Huawi Not 9 pro',
        subtitle: 'Huawi'),
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Huawi Not 9 pro',
        subtitle: 'Huawi'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: 15,
      ),

      //for headpage = Allphone & icon
      Row(
        children: [
          Icon(Icons.phone_android_rounded, size: 25, color: Bluecolor),
          SizedBox(
            width: 5,
          ),
          Text(
            'Latest Phones',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Bluecolor),
          )
        ],
      ),
      SizedBox(
        height: 30,
      ),
      // for head brand & i click in this to push to another screen has all phone in the same brand
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => allPhone_in_brand(
                      item: itemSumsang[0],
                    )),
          );
        },
        child: Text(
          'Sumsang',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(
        height: 20,
      ),

      //scrolling between cards for view phone
      Container(
        height: 250,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.all(16),
          itemCount: 6,
          separatorBuilder: (context, _) => SizedBox(
            width: 12,
          ),
          itemBuilder: (context, index) => Viewphone(item: itemSumsang[index]),
        ),
      ),
      SizedBox(
        height: 30,
      ),

      // for head brand & i click in this to push to another screen has all phone in the same brand
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => allPhone_in_brand(
                      item: itemRedmi[2],
                    )),
          );
        },
        child: Text(
          'Redmi',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(
        height: 20,
      ),

      //scrolling between cards for view phone
      Container(
        height: 250,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.all(16),
          itemCount: 6,
          separatorBuilder: (context, _) => SizedBox(
            width: 12,
          ),
          itemBuilder: (context, index) => Viewphone(item: itemRedmi[index]),
        ),
      ),
      SizedBox(
        height: 30,
      ),

      // for head brand & i click in this to push to another screen has all phone in the same brand
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => allPhone_in_brand(
                      item: itemHuawei[0],
                    )),
          );
        },
        child: Text(
          'Huawei',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(
        height: 20,
      ),

      //scrolling between cards for view phone
      Container(
        height: 250,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.all(16),
          itemCount: 6,
          separatorBuilder: (context, _) => SizedBox(
            width: 12,
          ),
          itemBuilder: (context, index) => Viewphone(item: itemHuawei[index]),
        ),
      ),
      SizedBox(
        height: 30,
      ),

      // for head brand & i click in this to push to another screen has all phone in the same brand
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => allPhone_in_brand(
                      item: itemApple[0],
                    )),
          );
        },
        child: Text(
          'Apple',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(
        height: 20,
      ),

      //scrolling between cards for view phone
      Container(
        height: 250,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.all(16),
          itemCount: 6,
          separatorBuilder: (context, _) => SizedBox(
            width: 12,
          ),
          itemBuilder: (context, index) => Viewphone(item: itemApple[index]),
        ),
      ),
    ]);
  }
}
