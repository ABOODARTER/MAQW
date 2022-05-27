

import 'package:flutter/material.dart';
import 'package:maqw/widget/formsingin.dart';

import '../main.dart';

class Vpass extends StatefulWidget {
  const Vpass({Key? key}) : super(key: key);

  @override
  State<Vpass> createState() => _VpassState();
}

class _VpassState extends State<Vpass> {
  static bool passwordvisible = true;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            passwordvisible!=passwordvisible;
            print("we");
          });
        },
        icon: Icon(
          passwordvisible ? Icons.visibility : Icons.visibility_off,
        ),
      color: bluee,
    );
    ;
  }
}
