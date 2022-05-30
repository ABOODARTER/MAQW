import 'package:flutter/material.dart';
class EnterPhone1 extends StatefulWidget {
  const EnterPhone1({Key? key}) : super(key: key);

  @override
  State<EnterPhone1> createState() => _EnterPhone1State();
}

class _EnterPhone1State extends State<EnterPhone1> {
  @override
  Widget build(BuildContext context) { return Scaffold(
      body:
      Container(
          padding:EdgeInsets.symmetric(horizontal:20),
          width:double.infinity,
          child:Column(
              mainAxisAlignment:MainAxisAlignment.center,
              children:[
          DropdownButton<String>(
          items: battare.map(String item){
      return DropdownMenuItem<String>(
      Value:item,
      Child:Text(item),
      );

      }
      ).toList(),
      onChanged:(string thesize){
        setstate(()
            selectedsize=thesize;
        )

      }
      value:selectedsize,
    )
    ]
    )
    )
  }
}
