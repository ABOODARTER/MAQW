import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../widget/navigationbottom.dart';

class Verification extends StatelessWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Container(
               child:  Image.asset("assets/images/correct.png"),
               ),
                SizedBox(
                  height: 70,
                ),
                Text(
                  "Successfully Verified",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 200,
                ),
                Container(
                    decoration: ShapeDecoration(
                      color: orangee,
                      shape: const CircleBorder(),
                    ),
                    child: IconButton(
                        onPressed: () {
                           // Navigator.of(context).pushNamed('');
                          },


                        icon: const Icon(
                          Icons.keyboard_arrow_right_rounded,
                          color: Colors.white,
                        ))),
              ],
            ),
          ),
        ),
    );
  }
}
