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
  List<CardItem> listphonessamsungResponse = [];
  List<CardItem> listphonesredmiResponse= [];
  List<CardItem> listphoneshuaweiResponse= [];
  List<CardItem> listphonesiphoneResponse= [];


  Map bodyResponse = {};
  Map dataphoneResponse = {};

  Future apicall() async {
    http.Response response;
    //here i put request url
    response = await http
        .get(Uri.parse("http://mobile.test:400/api/search_on_material_device"));
    if (response.statusCode == 200) {
      setState(() {
        bodyResponse = json.decode(response.body);
        dataphoneResponse = bodyResponse['body'];
      });
    }
  }

  @override
  void initState() {
    apicall();
    super.initState();
    dataphoneResponse['picture'].toString();
    dataphoneResponse['name'].toString();
    //list for cards view phone
    listphonessamsungResponse = [
      CardItem(
        assetImage: dataphoneResponse['picture'].toString(),
        title: dataphoneResponse['name'].toString(),
        subtitle: 'Sumsang',
      ),
      CardItem(
        assetImage: dataphoneResponse['picture'].toString(),
        title: dataphoneResponse['name'].toString(),
        subtitle: 'Sumsang',
      ),
      CardItem(
        assetImage: dataphoneResponse['picture'].toString(),
        title: dataphoneResponse['name'].toString(),
        subtitle: 'Sumsang',
      ),
      CardItem(
        assetImage: dataphoneResponse['picture'].toString(),
        title: dataphoneResponse['name'].toString(),
        subtitle: 'Sumsang',
      ),
      CardItem(
        assetImage: dataphoneResponse['picture'].toString(),
        title: dataphoneResponse['name'].toString(),
        subtitle: 'Sumsang',
      ),
      CardItem(
        assetImage: dataphoneResponse['picture'].toString(),
        title: dataphoneResponse['name'].toString(),
        subtitle: 'Sumsang',
      ),
    ];
    listphonesredmiResponse=[
      CardItem(
        assetImage: dataphoneResponse['picture'].toString(),
        title: dataphoneResponse['name'].toString(),
        subtitle: 'Redmi',
      ),
      CardItem(
        assetImage: dataphoneResponse['picture'].toString(),
        title: dataphoneResponse['name'].toString(),
        subtitle: 'Redmi',
      ),
      CardItem(
        assetImage: dataphoneResponse['picture'].toString(),
        title: dataphoneResponse['name'].toString(),
        subtitle: 'Redmi',
      ),
      CardItem(
        assetImage: dataphoneResponse['picture'].toString(),
        title: dataphoneResponse['name'].toString(),
        subtitle: 'Redmi',
      ),
      CardItem(
        assetImage: dataphoneResponse['picture'].toString(),
        title: dataphoneResponse['name'].toString(),
        subtitle: 'Redmi',
      ),
      CardItem(
        assetImage: dataphoneResponse['picture'].toString(),
        title: dataphoneResponse['name'].toString(),
        subtitle: 'Redmi',
      ),
    ];
    listphoneshuaweiResponse=[
      CardItem(
        assetImage: dataphoneResponse['picture'].toString(),
        title: dataphoneResponse['name'].toString(),
        subtitle: 'Huawei',
      ),
      CardItem(
        assetImage: dataphoneResponse['picture'].toString(),
        title: dataphoneResponse['name'].toString(),
        subtitle: 'Huawei',
      ),
      CardItem(
        assetImage: dataphoneResponse['picture'].toString(),
        title: dataphoneResponse['name'].toString(),
        subtitle: 'Huawei',
      ),
      CardItem(
        assetImage: dataphoneResponse['picture'].toString(),
        title: dataphoneResponse['name'].toString(),
        subtitle: 'Huawei',
      ),
      CardItem(
        assetImage: dataphoneResponse['picture'].toString(),
        title: dataphoneResponse['name'].toString(),
        subtitle: 'Huawei',
      ),
      CardItem(
        assetImage: dataphoneResponse['picture'].toString(),
        title: dataphoneResponse['name'].toString(),
        subtitle: 'Huawei',
      ),
    ];
    listphonesiphoneResponse= [
      CardItem(
        assetImage: dataphoneResponse['picture'].toString(),
        title: dataphoneResponse['name'].toString(),
        subtitle: 'Iphone',
      ),
      CardItem(
        assetImage: dataphoneResponse['picture'].toString(),
        title: dataphoneResponse['name'].toString(),
        subtitle: 'Iphone',
      ),
      CardItem(
        assetImage: dataphoneResponse['picture'].toString(),
        title: dataphoneResponse['name'].toString(),
        subtitle: 'Iphone',
      ),
      CardItem(
        assetImage: dataphoneResponse['picture'].toString(),
        title: dataphoneResponse['name'].toString(),
        subtitle: 'Iphone',
      ),
      CardItem(
        assetImage: dataphoneResponse['picture'].toString(),
        title: dataphoneResponse['name'].toString(),
        subtitle: 'Iphone',
      ),
      CardItem(
        assetImage: dataphoneResponse['picture'].toString(),
        title: dataphoneResponse['name'].toString(),
        subtitle: 'Iphone',
      ),
    ];
  }
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
                      item: listphonessamsungResponse[0],
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
          itemBuilder: (context, index) => Viewphone(item: listphonessamsungResponse[index]),
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
                      item:listphonesredmiResponse[2],
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
          itemBuilder: (context, index) => Viewphone(item: listphonesredmiResponse[index]),
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
                      item: listphoneshuaweiResponse[0],
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
          itemBuilder: (context, index) => Viewphone(item: listphoneshuaweiResponse[index]),
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
                      item: listphonesiphoneResponse[0],
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
          itemBuilder: (context, index) => Viewphone(item: listphonesiphoneResponse[index]),
        ),
      ),
    ]);
  }
}
