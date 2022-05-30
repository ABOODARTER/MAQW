import 'package:flutter/material.dart';

import '../main.dart';
class Empty extends StatelessWidget {
  const Empty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Not Screen",style: TextStyle(fontSize: 40,color: bluee),),
          ],
        )
      ),
    );
  }
}
