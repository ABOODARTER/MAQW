import 'dart:core';

import 'package:flutter/material.dart';
import 'package:maqw/screens/sign%20up1.dart';
import 'package:maqw/widget/iconStyle.dart';


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
                onpress: ()=>Navigator.of(context).pushNamed('allphone'),
                image: ImageIcon[0],
                textbottn: "All Phone"),
            IconStyle(
                onpress: ()=>Navigator.of(context).pushNamed('compartion'),
                image: ImageIcon[1],
                textbottn: "comparison"),
            IconStyle(
                onpress: ()=>Navigator.of(context).pushNamed('empty'),
                image: ImageIcon[2],
                textbottn: "conversation"),
            IconStyle(
                onpress: ()=>Navigator.of(context).pushNamed('map'),
                image: ImageIcon[3],
                textbottn: "maintenance"),

          ],
        ),
      );

  }
}
