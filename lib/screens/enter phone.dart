import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:maqw/widget/containericon.dart';
import 'package:maqw/widget/dropbutton.dart';
import '../main.dart';
import '../widget/textform.dart';
class EnterPhone extends StatefulWidget {
  const EnterPhone({Key? key}) : super(key: key);

  @override
  State<EnterPhone> createState() => _EnterPhoneState();
}

class _EnterPhoneState extends State<EnterPhone> {
  // key
  final forKeyEnterPhone = GlobalKey<FormState>();

  //editing controller
  final TextEditingController colorPhoneController = TextEditingController();
  final TextEditingController pricePhoneController = TextEditingController();

  File? _image;

  Future getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() {
      _image = imageTemporary;
    });
  }

 // variable to radio
  int _radio = 1;

  // api to select brand
  String urlB = "";
  List brands = [];
  Map brand = {};
  String valueBrand = "";
  List listBrandName = [];

  Future selectBrand() async {
    http.Response responseB = await http.get(Uri.parse("http://mobile.test:400/api/return_brand_device"));
    if (responseB.statusCode == 200) {
      setState(() {
        brands = jsonDecode(responseB.body);
        for (int i = 0; i < brands.length; i++) {
          brand = brands[i];
          listBrandName = brand['name'];
          valueBrand = brand['id'];
        }
      });
    }
  }

  // api to select name
  String urlN = "";
  List devices = [];
  Map device = {};
  List listNamePhone = [];
  String valueName = "";

  Future selectName() async {
    http.Response responseN = await http.get(Uri.parse("http://mobile.test:400/api/search_on_material_device"));
    if (responseN.statusCode == 200) {
      setState(() {
        devices = jsonDecode(responseN.body);
        for (int i = 0; i < devices.length; i++) {
          device = devices[i];
          listNamePhone = device['Name'];
          valueName = device['id_device'];
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: imageProfile(),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 230,
                  bottom: 5,
                ),
                child: Text(
                  "Brand phone",
                  style: TextStyle(
                    fontSize: 17,
                    color: bluee,
                  ),
                ),
              ),
              DropButton(
                  value: valueBrand,
                  hint: "Select brand phone",
                  items: listBrandName.map((item) {
                        return DropdownMenuItem(
                          child: Text(
                            item[0],
                            style: TextStyle(color: bluee),
                          ),
                          value: item[0].toString(),
                        );
                      }).toList() ,
                  onchange: (value) {
                    setState(() {
                      valueBrand = value;
                      selectBrand();
                      print("${valueBrand}");
                    });
                  }),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 230,
                  bottom: 5,
                ),
                child: Text(
                  "Name phone",
                  style: TextStyle(
                    fontSize: 17,
                    color: bluee,
                  ),
                ),
              ),
              DropButton(
                  value: "1",
                  hint: "Select name phone",
                  items: listNamePhone.map((item) {
                        return DropdownMenuItem(
                          child: Text(
                            item[0],
                            style: TextStyle(color: bluee),
                          ),
                          value: item[0].toString(),
                        );
                      }).toList() ,
                  onchange: (value) {
                    setState(() {
                      valueBrand = value;
                      selectBrand();
                      print("${valueBrand}");
                    });
                  }),
              Form(
                key: forKeyEnterPhone,
                child: Column(children: [
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormC(
                    TextTop: "Color Phone",
                    TextHint: "Enter color phone",
                    TextInputAction1: TextInputAction.next,
                    controller: colorPhoneController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "color phone required";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormC(
                    TextTop: "Price Phone",
                    TextHint: "Enter price phone",
                    TextInputAction1: TextInputAction.done,
                    controller: pricePhoneController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "price phone required";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 260,
                      bottom: 5,
                    ),
                    child: Text(
                      "Phone",
                      style: TextStyle(fontSize: 20, color: bluee),
                    ),
                  ),
                  Row(
                    children: [
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
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
                              "used",
                              style: Theme.of(context).textTheme.headline1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ]),
              ),
              const SizedBox(
                height: 30,
              ),
              ContainerIconright(
                onpress: () {
                  if (forKeyEnterPhone.currentState!.validate()) {
                    enterphone();
                    if (_radio == 1) {
                      Navigator.of(context).pushReplacementNamed('enterphone1');
                    } else if (_radio == 2) {
                       Navigator.of(context).pushReplacementNamed('salcenter');
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

  Widget bottomSheet() {
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
  Widget imageProfile() {
    return Stack(
      children: [
        CircleAvatar(
            radius: 80.0,
            backgroundImage: (_image != null)
                ? FileImage(_image!) as ImageProvider
                : const AssetImage("assets/images/camera.png")),
        Positioned(
          bottom: 15.0,
          right: 20.0,
          // click icon show bottom sheet
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context, builder: (builder) => bottomSheet());
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
    String url = "";
    Map myData = {
      'colorphone': colorPhoneController.text,
      'pricephone': pricePhoneController.text,
      'type': _radio
    };
    http.Response response = await http.post(Uri.parse( "http://mobile.test:400/api/Info"), body: myData);
    var data = jsonEncode(response.body);
  }
}
