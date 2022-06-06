import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
      _image=imageTemporary;
    }
    );
  }
  // key
  final forKeyCenter1 = GlobalKey<FormState>();

  //editing controller
  final TextEditingController locationController = TextEditingController();

  // variable to radio
  int _Selectedradio = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: ImageProfile()),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 260,
                    bottom: 5,
                  ),
                  child: Text(
                    "Adders",
                    style: TextStyle(
                      fontSize: 17,
                      color: bluee,
                    ),
                  ),
                ),
                Form(
                  key: forKeyCenter1,
               child: TextFormField(
                 controller: locationController,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: "Enter your adders",
                    hintStyle: Theme.of(context).textTheme.headline1,
                    prefixIcon: const Icon(Icons.place),
                  ),
                ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 260,
                    bottom: 5,
                  ),
                  child: Text(
                    "Type",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  child: Row(
                    children: [
                      Radio(
                        toggleable:true ,
                        activeColor: bluee,
                        value: 1,
                        groupValue: _Selectedradio,
                        onChanged: ( value) {
                          setState(() {
                            _Selectedradio = value as int;
                              print("$value");

                          });
                        },
                      ),
                      Text(
                        "sales and maintenance center",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Radio(
                      activeColor: bluee,
                      value:2,
                      groupValue: _Selectedradio,
                      onChanged: (value) {
                        setState(() {
                          _Selectedradio = value as int;
                          print("$value");
                        });
                      },
                    ),
                    Text(
                      "maintenance center",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      toggleable: true,
                      activeColor: bluee,
                      value: 3,
                      groupValue: _Selectedradio,
                      onChanged: (value) {
                        setState(() {
                          _Selectedradio = value as int;
                          print("$value");
                        });
                      },
                    ),
                    Text(
                      "sale center",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ],
                ),

                const SizedBox(
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
                              centerData();
                              imagestore();
                              // sale center=>enter phone || maintenance center=> main screen
                              if(_Selectedradio==1){
                                  Navigator.of(context).pushReplacementNamed('enterphone');
                              }
                              else if(_Selectedradio==2){
                                //  Navigator.of(context).pushReplacementNamed('screen maintenance');
                              }
                              else if(_Selectedradio==3){
                                  Navigator.of(context).pushReplacementNamed('enterphone');
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
              TextButton.icon(
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
              TextButton.icon(
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
          backgroundImage: (_image!=null)?FileImage(_image!)as ImageProvider:const AssetImage("assets/images/camera.png")
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

  // Api to store location and type
  Future<void>centerData() async{
    String Url="";
    Map MyData={
      'location':locationController.text,
      'type':_Selectedradio,
    };
    http.Response response= await http.post(Uri.parse(Url),body: MyData);
    var data = jsonEncode(response.body);

  }
  // Api to store image
  Future <void>imagestore()async{
    if(_image==null)return;
    String imagebase64=base64Encode(_image!.readAsBytesSync());
    String imagename=_image!.path.split("/").last;
    print(imagename);
    var Url="";
    var data={
      "imagename":imagename,
      "imagebase64":imagebase64,
    };
    var response= await http.post(Uri.parse(Url),body: data);
  }
}
