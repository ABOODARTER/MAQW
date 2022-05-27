import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:maqw/main.dart';
import 'package:http/http.dart' as http;


class CenterData1 extends StatefulWidget {
  const CenterData1({Key? key}) : super(key: key);

  @override
  State<CenterData1> createState() => _CenterDataState1();
}

class _CenterDataState1 extends State<CenterData1> {
  File?_image;
  Future getImage(ImageSource source)async{
    final image=await ImagePicker().pickImage(source: source);
    if(image==null)return;
    final imageTemporary=File(image.path);
    setState((){
      this._image=imageTemporary;
    }
    );
  }
  // key
  final forKeyCenter1 = GlobalKey<FormState>();

  //editing controller
  final TextEditingController locationController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController typeController = TextEditingController();

  // variable to radio
  int _radio = 1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: ImageProfile()),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 260,
                    bottom: 5,
                  ),
                  child: Text(
                    "Addres",
                    style: TextStyle(
                      fontSize: 17,
                      color: bluee,
                    ),
                  ),
                ),
                Form(
                  key: forKeyCenter1,
               child: TextFormField(
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: "Enter your addres",
                    hintStyle: Theme.of(context).textTheme.headline1,
                    prefixIcon: Icon(Icons.place),
                  ),
                ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 260,
                    bottom: 5,
                  ),
                  child: Text(
                    "Type",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Radio(
                     // key: forKeyCenter1,
                      activeColor: bluee,
                      value: 1,
                      groupValue: _radio,
                      onChanged: (value) {
                        setState(() {
                          _radio = value as int;
                        });
                      },
                    ),
                    Text(
                      "sales and maintenance center",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      activeColor: bluee,
                      value: 2,
                      groupValue: _radio,
                      onChanged: (value) {
                        setState(() {
                          _radio = value as int;
                        });
                      },
                    ),
                    Text(
                      "maintenance center ",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      activeColor: bluee,
                      value: 3,
                      groupValue: _radio,
                      onChanged: (value) {
                        setState(() {
                          _radio = value as int;
                        });
                      },
                    ),
                    Text(
                      "sale center",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ],
                ),

                SizedBox(
                  height: 70,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                      decoration: ShapeDecoration(
                        color: orangee,
                        shape: const CircleBorder(),
                      ),
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('centerdata');
                          },
                          icon: const Icon(
                            Icons.keyboard_arrow_left_rounded,
                            color: Colors.white,
                          ))),
                  const SizedBox(
                    width: 70,
                  ),
                  Container(
                      decoration: ShapeDecoration(
                        color: orangee,
                        shape: const CircleBorder(),
                      ),
                      child: IconButton(
                          onPressed: () {
                            if (forKeyCenter1.currentState!.validate()) {
                              BottomSheet();
                              centerData();
                              // sale center=>enter phone || maintenance center=> main screen
                              if(_radio==1){
                                //  Navigator.of(context).pushReplacementNamed('enter phone');
                              }
                              else if(_radio==2){
                                //  Navigator.of(context).pushReplacementNamed('screen maintenance');
                              }
                              else if(_radio==3){
                                //  Navigator.of(context).pushReplacementNamed('enter phone');
                              }

                            }
                          },
                          icon: const Icon(
                            Icons.keyboard_arrow_right_rounded,
                            color: Colors.white,
                          ))),
                ]),
              ],
            ),
          )),
        ),
      ),
    );
  }

  Widget BottomSheet() {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Text(
            "Choose profile image",
            style: TextStyle(
              color: bluee,
              fontSize: 22,
              fontWeight: FontWeight.w500,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton.icon(
                  onPressed: () {
                    getImage(ImageSource.camera);
                  },
                  icon: Icon(
                    Icons.camera_alt,
                    color: bluee,
                    size: 25,
                  ),
                  label: const Text(
                       "Camera",
                    style: TextStyle(
                        color: Colors.black54, fontSize: 17, letterSpacing: 1),
                  )),
              // SizedBox(width: 120,),
              FlatButton.icon(
                  onPressed: () {
                    getImage(ImageSource.gallery);
                  },
                  icon: Icon(
                    Icons.image,
                    color: bluee,
                    size: 25,
                  ),
                  label:const Text(
                    "Gallery",
                    style: TextStyle(
                        color: Colors.black54, fontSize: 17, letterSpacing: 1),
                  ))
            ],
          )
        ],
      ),
    );
  }

// widget to show profile image
  Widget ImageProfile() {
    return Stack(
      children: [
        CircleAvatar(
          radius: 80.0,
          backgroundImage: (_image!=null)?FileImage(_image!)as ImageProvider:AssetImage("assets/images/camera.png")
        ),
        Positioned(
          bottom: 15.0,
          right: 20.0,
          // click icon show bottom sheet
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context, builder: (builder) => BottomSheet());
            },
            child: Icon(
              Icons.add_a_photo,
              color: bluee,
              size: 28,
            ),
          ),
        ),
      ],
    );
  }
  Future<void>centerData() async{
    String Url="";
    Map MyData={
      'location':locationController.text,
      'image':imageController.text,
      'type':typeController.text,
    };
    http.Response response= await http.post(Uri.parse(Url),body: MyData);
    var data = jsonEncode(response.body);

  }
}
