import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maqw/main.dart';
import 'package:maqw/widget/searchwidget1.dart';
import '../widget/searchwidget.dart';
import 'AllPhone.dart';
import 'AllPhone_In_Brand.dart';
import 'Colors.dart';
import 'ContactUs.dart';
import 'Compartion.dart';
import 'PagePhone.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Sale_Center_personalty.dart';
import '../widget/searchwidget1.dart';
import 'dart:async';

import 'mainscreen.dart';

class sale_center extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return allPhoneState();
  }
}

class allPhoneState extends State<sale_center> {
  final controller = TextEditingController();
  String? stringResponse;
  List listResponse = [];
  Map mapResponse = {};
  String searchdata = '';

  Future apicall() async {
    http.Response response;
    //here i put request url
    response = await http.get(Uri.parse(" "));
    if (response.statusCode == 200) {
      setState(() {
        mapResponse = json.decode(response.body);
        listResponse = mapResponse['devicedata'];
      });
    }
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

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
  Widget Viewphone({
    required CardItem item,
  }) =>
      Container(
        width: 150,
        height: 100,
        padding: EdgeInsets.all(5),
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
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 3 / 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Material(
                    child: Ink.image(
                      image: AssetImage(item.assetImage),
                      fit: BoxFit.cover,
                      child: InkWell(
                        onTap: () =>
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        pagephone(item: item))),
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
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text(
              item.subtitle,
              style: TextStyle(fontSize: 15, color: Colors.black54),
            )
          ],
        ),
      );
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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Bluecolor,
          title: Text(
            'sale name',
            style: TextStyle(color: w),
          ),
          centerTitle: true,
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              padding: EdgeInsets.only(top: 15, left: 10, right: 10),
              color: w,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),

                    // for search box
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Greycolor),
                        borderRadius: BorderRadius.circular(15.0),
                        color: Greycolor,
                        boxShadow: [
                          BoxShadow(
                              color: verygrey,
                              blurRadius: 4.0,
                              offset: Offset(0, 3)),
                          BoxShadow(color: Greycolor, offset: Offset(-2, 0)),
                          BoxShadow(color: Greycolor, offset: Offset(1, 0)),
                          BoxShadow(color: Greycolor, offset: Offset(0, -0.5)),
                        ],
                      ),
                      child:
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          prefixIcon: GestureDetector(
                            child: Icon(Icons.search,),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          search()));
                            }
                        ),
                          suffixIcon:
                               GestureDetector(
                            child: Icon(Icons.close,),
                            onTap: (){
                              controller.clear();
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                        ),
                        ),
                        keyboardType: TextInputType.text,

                      ),),
                    SizedBox(
                      height: 30,
                    ),
                    //for headpage = New Phone & icon
                    Row(
                      children: [
                        Icon(
                          Icons.phone_android_rounded,
                          size: 25,
                          color: Bluecolor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'New Phones',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Bluecolor),
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
                              builder: (context) =>
                                  allPhone_in_brand(
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
                        separatorBuilder: (context, _) =>
                            SizedBox(
                              width: 12,
                            ),
                        itemBuilder: (context, index) =>
                            Viewphone(item: itemSumsang[index]),
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
                              builder: (context) =>
                                  allPhone_in_brand(
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
                        separatorBuilder: (context, _) =>
                            SizedBox(
                              width: 12,
                            ),
                        itemBuilder: (context, index) =>
                            Viewphone(item: itemRedmi[index]),
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
                              builder: (context) =>
                                  allPhone_in_brand(
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
                        separatorBuilder: (context, _) =>
                            SizedBox(
                              width: 12,
                            ),
                        itemBuilder: (context, index) =>
                            Viewphone(item: itemHuawei[index]),
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
                              builder: (context) =>
                                  allPhone_in_brand(
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
                        separatorBuilder: (context, _) =>
                            SizedBox(
                              width: 12,
                            ),
                        itemBuilder: (context, index) =>
                            Viewphone(item: itemApple[index]),
                      ),
                    ),
                    SizedBox(height: 50,),
                    //for headpage = old Phone & icon
                    Row(
                      children: [
                        Icon(
                          Icons.phone_android_rounded,
                          size: 25,
                          color: Bluecolor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Old Phones',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Bluecolor),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  allPhone_in_brand(
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
                        separatorBuilder: (context, _) =>
                            SizedBox(
                              width: 12,
                            ),
                        itemBuilder: (context, index) =>
                            Viewphone(item: itemSumsang[index]),
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
                              builder: (context) =>
                                  allPhone_in_brand(
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
                        separatorBuilder: (context, _) =>
                            SizedBox(
                              width: 12,
                            ),
                        itemBuilder: (context, index) =>
                            Viewphone(item: itemRedmi[index]),
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
                              builder: (context) =>
                                  allPhone_in_brand(
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
                        separatorBuilder: (context, _) =>
                            SizedBox(
                              width: 12,
                            ),
                        itemBuilder: (context, index) =>
                            Viewphone(item: itemHuawei[index]),
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
                              builder: (context) =>
                                  allPhone_in_brand(
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
                        separatorBuilder: (context, _) =>
                            SizedBox(
                              width: 12,
                            ),
                        itemBuilder: (context, index) =>
                            Viewphone(item: itemApple[index]),
                      ),
                    ),
                    SizedBox(height: 10,),

                  ]),

            ),
          ],
        ),
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
    );
  }
}
class CardItem {
  final String assetImage;
  final String title;
  final String subtitle;

  const CardItem({
    required this.assetImage,
    required this.title,
    required this.subtitle,
  });
}
