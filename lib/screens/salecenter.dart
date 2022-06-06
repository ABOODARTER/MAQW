import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maqw/widget/searchwidget1.dart';
import '../widget/searchwidget.dart';
import 'AllPhone_In_Brand.dart';
import 'Colors.dart';
import 'ContactUs.dart';
import 'Compartion.dart';
import 'PagePhone.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Sale_Center_personalty.dart';

class sale_center extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return allPhoneState();
  }
}



class allPhoneState extends State<sale_center> {
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
      body:ListView(
        scrollDirection: Axis.vertical,
        children: [
        Container(
        padding: EdgeInsets.only(top: 15, left: 10, right: 10),
        color: w,
        child:
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
        height: 15,
        ),

        //for headpage = Allphone & icon
        Row(
        children: [
        Icon(
        Icons.phone_android_rounded,
        size: 20,
        ),
        SizedBox(
        width: 5,
        ),
        Text(
        'Phones',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    )
    ],
    ),
    SizedBox(
    height: 30,
    ),

    // for search box
    Container(
    decoration: BoxDecoration(
    border: Border.all(color: Greycolor),
    borderRadius: BorderRadius.circular(15.0),
    color: Greycolor,
    boxShadow: [
    BoxShadow(
    color: verygrey, blurRadius: 4.0, offset: Offset(0, 3)),
    BoxShadow(color: Greycolor, offset: Offset(-2, 0)),
    BoxShadow(color: Greycolor, offset: Offset(1, 0)),
    BoxShadow(color: Greycolor, offset: Offset(0, -0.5)),
    ],
    ),child: Stack(
      alignment: Alignment.center,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            search()));
              },
              icon: Icon(Icons.search),
              highlightColor: Colors.white60,
            ),
            SizedBox(
              width: 220,
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.close)),
          ],
        ),
        TextFormField(
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Greycolor),
                borderRadius: BorderRadius.circular(15.0)),
          ),
          keyboardType: TextInputType.text,
        ),
      ],
    ),
  )]))]));
  }

}
