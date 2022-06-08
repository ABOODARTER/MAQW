import 'dart:core';

import 'package:flutter/material.dart';
import 'package:maqw/screens/AllPhone.dart';
import 'package:maqw/screens/sign%20up1.dart';
import 'package:maqw/widget/iconStyle.dart';

import '../screens/Compartion.dart';
import '../screens/empty.dart';
import '../screens/map.dart';
class ScrollContinerIcon extends StatefulWidget {
  const ScrollContinerIcon({Key? key}) : super(key: key);

  @override
  State<ScrollContinerIcon> createState() => _ScrollContinerIconState();
}

class _ScrollContinerIconState extends State<ScrollContinerIcon> {
  List<String> ImageIcon = [
    "assets/images/allphone.png",
    "assets/images/c.png",
    "assets/images/co.png",
    "assets/images/m.png",
  ];

  @override
  Widget build(BuildContext context) {
    return
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            IconStyle(
                onpress: ()=> Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => allPhone())),
                image: ImageIcon[0],
                textbottn: "All Phone"),
            IconStyle(
                onpress: ()=> Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => compartion())),
                image: ImageIcon[1],
                textbottn: "comparison"),
            IconStyle(
                onpress: ()=> Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Empty())),
                image: ImageIcon[2],
                textbottn: "conversation"),
          ],
        ),
      );

  }
}
