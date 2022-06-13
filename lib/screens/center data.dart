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


  @override
  Widget build(BuildContext context) {
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
                const SizedBox(
                  height: 40,
                ),
                Form(
                  key: forKeyCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
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
                          controller: nameController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              border: const UnderlineInputBorder(),
                              hintText:"Enter your name",
                              hintStyle: Theme.of(context).textTheme.headline1,
                              prefixIcon: const Icon(Icons.edit),
                            )),
                        const SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
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
                          controller:timeOpenController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                           hintText: 'Enter your time open',
                                hintStyle: Theme.of(context).textTheme.headline1,
                              prefixIcon: const Icon(Icons.access_time),
                            ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
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

                            TextFormField(
                              controller: timeCloseController,
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'Enter your time close',
                                  hintStyle: Theme.of(context).textTheme.headline1,
                                  prefixIcon: const Icon(Icons.access_time),
                                )),
                        const SizedBox(height: 50,),
                        Container(
                            decoration: ShapeDecoration(
                              color: orangee,
                              shape: const CircleBorder(),
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
   http.Response response= await http.post(Uri.parse("http://localhost:8000/api/centers"),body: MyData);
 }
}
