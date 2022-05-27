import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:maqw/main.dart';
import 'package:http/http.dart' as http;

class CenterData extends StatefulWidget {
  const CenterData({Key? key}) : super(key: key);

  @override
  State<CenterData> createState() => _CenterDataState();
}

class _CenterDataState extends State<CenterData> {
  // key
  final forKeyCenter = GlobalKey<FormState>();

  //editing controller
  final TextEditingController nameController = TextEditingController();
  final TextEditingController timeOpenController = TextEditingController();
  final TextEditingController timeCloseController = TextEditingController();

 TimeOfDay timeo=TimeOfDay.now();

 Future<Null>selectTimeo(BuildContext ctx)async{
   TimeOfDay ?newTimeo=await showTimePicker(
     context: ctx,
     initialTime:timeo ,
   );
   // if CANCEL => null
   if(newTimeo==null)return;
   // else OK
   setState(() {
     timeo=newTimeo;
   });

 }
 TimeOfDay timec=TimeOfDay.now();

 Future<Null>selectTimec(BuildContext ctx1)async{
   TimeOfDay?newTimec=await showTimePicker(
     context: ctx1,
     initialTime:timec ,
   );
   // if CANCEL => null
   if(newTimec==null)return;
   // else OK
   setState(() {
     timec=newTimec;
   });

 }

  @override
  Widget build(BuildContext context) {
   // style time open
    final hourso=timeo.hour.toString().padLeft(2,'0');
    final minuteso=timeo.minute.toString().padLeft(2,'0');
    // style time close
    final hoursc=timeo.hour.toString().padLeft(2,'0');
    final minutesc=timeo.minute.toString().padLeft(2,'0');
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Image.asset("assets/images/centerdata.png",
                    height: MediaQuery.of(context).size.height * 0.3),
                Text(
                  'Please Enter\nThe Center Data',
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(
                  height: 40,
                ),
                Form(
                  key: forKeyCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            right: 230,
                            bottom: 5,
                          ),
                          child: Text(
                            "Name",
                            style: TextStyle(
                              fontSize: 17,
                              color: bluee,
                            ),
                          ),
                        ),
                        TextFormField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              hintText:"Enter your name",
                              hintStyle: Theme.of(context).textTheme.headline1,
                              prefixIcon: Icon(Icons.edit),
                            )),
                        SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: 230,
                            bottom: 5,
                          ),
                          child: Text(
                            "Time Open",
                            style: TextStyle(
                              fontSize: 17,
                              color: bluee,
                            ),
                          ),
                        ),
                        TextFormField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                          //  readOnly: true,
                            // onTap: ()async{
                            //   setState(() {
                            //     selectTimeo(context);
                            //     print("we");
                            //   });
                            // },
                            decoration: InputDecoration(
                           hintText: '$hourso:$minuteso',
                                hintStyle: Theme.of(context).textTheme.headline1,
                              prefixIcon: Icon(Icons.access_time),
                            ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: 230,
                            bottom: 5,
                          ),
                          child: Text(
                            "Time Close",
                            style: TextStyle(
                              fontSize: 17,
                              color: bluee,
                            ),
                          ),
                        ),
                        Builder(
                          builder: ( ctx1){
                            return TextFormField(
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.number,
                               // readOnly: true,
                                // onTap: ()async{
                                //   setState(() {
                                //     selectTimec(ctx1);
                                //     print("wed");
                                //   });
                                // },
                                decoration: InputDecoration(
                                  hintText: '$hoursc:$minutesc',
                                  hintStyle: Theme.of(context).textTheme.headline1,
                                  prefixIcon: Icon(Icons.access_time),
                                ));

                          },

                        ),
                        SizedBox(height: 50,),
                        Container(
                            decoration: ShapeDecoration(
                              color: orangee,
                              shape: CircleBorder(),
                            ),
                            child: IconButton(
                                onPressed: () {
                                if (forKeyCenter.currentState!.validate()) {
                                  centerData();
                                  Navigator.of(context).pushReplacementNamed('centerdata1');
                                }
                                },
                                icon:const Icon(
                                  Icons.keyboard_arrow_right_rounded,
                                  color: Colors.white,
                                ))),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),

    );

  }
 Future<void>centerData() async{
String Url="";
   Map MyData={
     'name':nameController.text,
     'timeOpen':timeOpenController.text,
     'timeClose':timeCloseController.text,
   };
   http.Response response= await http.post(Uri.parse(Url),body: MyData);
   var data = jsonEncode(response.body);

 }
}
