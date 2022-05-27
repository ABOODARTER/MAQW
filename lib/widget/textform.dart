import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../main.dart';
class TextFormC extends StatefulWidget {


  @override
  State<TextFormC> createState() => _TextFormCState();
  final String TextTop;
  final String TextHint;
  final TextInputAction TextInputAction1;
  final TextEditingController controller;
  final FormFieldValidator validator;

  const TextFormC({Key? key, required this.TextTop, required this.TextHint,required this.TextInputAction1,required this.controller,required this.validator}) : super(key: key);
}

class _TextFormCState extends State<TextFormC> {

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
    Padding(
    padding: EdgeInsets.only(
    right: 230,
      bottom: 5,
    ),
    child: Text(
    widget.TextTop,
    style: TextStyle(
    fontSize: 17,
    color: bluee,
    ),
    ),
    ),
    TextFormField(
      validator:widget.validator,
    textInputAction:widget.TextInputAction1,
    decoration: InputDecoration(
    hintText: widget.TextHint,
    hintStyle: Theme.of(context).textTheme.headline1,
    ),
    ),
      ]);
  }
}
