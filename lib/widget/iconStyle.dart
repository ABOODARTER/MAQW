import 'package:flutter/material.dart';

import '../main.dart';

class IconStyle extends StatefulWidget {
  const IconStyle(
      {Key? key,
      required this.onpress,
      required this.image,
      required this.textbottn})
      : super(key: key);

  @override
  State<IconStyle> createState() => _IconStyleState();
  final GestureTapCallback onpress;
  final String image;
  final String textbottn;
}

class _IconStyleState extends State<IconStyle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8.0),
          child: InkWell(
            onTap: widget.onpress,
            child: Image.asset(widget.image),
          ),
        ),
        SizedBox(
          height: 1,
        ),
        Text(widget.textbottn,style: TextStyle(fontSize: 17,color: bluee)),
      ],
    );
  }
}
