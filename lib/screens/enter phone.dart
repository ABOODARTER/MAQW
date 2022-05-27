import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:maqw/widget/containericon.dart';
import '../main.dart';
import '../widget/textform.dart';

class EnterPhone extends StatefulWidget {
  const EnterPhone({Key? key}) : super(key: key);

  @override
  State<EnterPhone> createState() => _EnterPhoneState();
}

class _EnterPhoneState extends State<EnterPhone> {
  //form key
  final forKeyenterphone = GlobalKey<FormState>();

  //editing controller
  final TextEditingController namephoneController = new TextEditingController();
  final TextEditingController brandphoneController =
      new TextEditingController();
  final TextEditingController colorphoneController =
      new TextEditingController();
  final TextEditingController pricephoneController =
      new TextEditingController();

  File? _image;

  Future getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() {
      this._image = imageTemporary;
    });
  }

// variable to radio
  int _radio = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: ImageProfile(),
              ),
              SizedBox(
                height: 30,
              ),
              Form(
                key: forKeyenterphone,
                child: Column(children: [
                  TextFormC(
                    TextTop: "Name Phone",
                    TextHint: "Enter name phone",
                    TextInputAction1: TextInputAction.next,
                    controller: namephoneController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "name phone required";
                      }
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormC(
                    TextTop: "Brand Phone",
                    TextHint: "Enter brand phone",
                    TextInputAction1: TextInputAction.next,
                    controller: brandphoneController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "brand phone required";
                      }
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormC(
                    TextTop: "Color Phone",
                    TextHint: "Enter color phone",
                    TextInputAction1: TextInputAction.next,
                    controller: colorphoneController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "color phone required";
                      }
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormC(
                    TextTop: "Price Phone",
                    TextHint: "Enter price phone",
                    TextInputAction1: TextInputAction.done,
                    controller: pricephoneController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "price phone required";
                      }
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 260,
                      bottom: 5,
                    ),
                    child: Text(
                      "Phone",
                      style: TextStyle(fontSize: 20, color: bluee),
                    ),
                  ),
                  Row(children: [
                    Radio(
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
                      "new",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ]),
                  Row(
                    children: [
                      Radio(
                        // key: forKeyCenter1,
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
                        "used",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ],
                  ),
                ]),
              ),
              ContainerIconright(
                onpress: () {
                  if (forKeyenterphone.currentState!.validate()) {
                    enterphone();
                    if (_radio == 1) {
                      //  Navigator.of(context).pushReplacementNamed('enterphone1');
                    } else if (_radio == 2) {
                      //  Navigator.of(context).pushReplacementNamed('screencenter');
                    }
                  }
                },
              )
            ]),
          ),
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
            "Choose phone image",
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
                  label: const Text(
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
            backgroundImage: (_image != null)
                ? FileImage(_image!) as ImageProvider
                : AssetImage("assets/images/camera.png")),
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

  Future<void> enterphone() async {
    String Url = "";
    Map MyData = {
      'namephone': namephoneController.text,
      'brandphone': brandphoneController.text,
      'colorphone': colorphoneController.text,
      'pricephone': pricephoneController.text,
    };
    http.Response response = await http.post(Uri.parse(Url), body: MyData);
    var data = jsonEncode(response.body);
  }
}
