import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maqw/widget/navigationbottom.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:image_picker/image_picker.dart';
import 'Colors.dart';
import 'ContactUs.dart';
import 'Compartion.dart';
import 'AllPhone.dart';
import'../main.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'enter phone.dart';
import 'enterphone1.dart';

class sale_center_personalty extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _salecenter();
  }
}

class _salecenter extends State<sale_center_personalty> {
  final forkeyup = GlobalKey<FormState>();

  //editing controller

  final TextEditingController nameController = TextEditingController();
  final TextEditingController TimeOpenController = TextEditingController();
  final TextEditingController TimeCloseController = TextEditingController();
  final TextEditingController LandLineController = TextEditingController();
  bool isValid = false;

  void selectScreen(BuildContext ctx, String s) {
    Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
      if (s == "ContatUs")
        return contact_Us();
      else if (s == 'Compartion')
        return compartion();
      else if (s == "allphone")
        return allPhone();
      else
        return MyHomePage();
    }));
  }
  File?_image;
  Future getImage(ImageSource source)async{
    final image=await ImagePicker().pickImage(source: source);
    if(image==null)return;
    final imageTemporary=File(image.path);
    setState((){
      this._image=imageTemporary;
    }
    );}
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
  Widget ImageProfile() {
    return Stack(
      children: [
        CircleAvatar(
            radius: 45.0,
            backgroundImage: (_image!=null)?FileImage(_image!)as ImageProvider:AssetImage("assets/images/user.png")
        ),
        Positioned(
          bottom: 4.0,
          right: 62.0,
          // click icon show bottom sheet
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context, builder: (builder) => BottomSheet());
            },
            child: Icon(
              Icons.add_a_photo,
              color: w,
              size: 28,
            ),
          ),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: Scaffold(
          appBar: AppBar(
            leading: Builder(builder: (context) {
              return IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: Icon(Icons.menu_rounded),
                color: b,
              );
            }),
            title: Text(
              'Sale Center',
              style: TextStyle(color: b),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.person_pin,
                  size: 30,
                  color: b,
                ),
                onPressed: () {},
              ),
            ],
            backgroundColor: w,
          ),
          body: Container(
              child: ListView(
                  children: [
                SingleChildScrollView(
                  child:Stack(
                    alignment: AlignmentDirectional.topStart,
                    children:[
                      Container(
                        height: 638,
                        width:360,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue.withOpacity(0.6),
                          borderRadius:BorderRadius.only(bottomLeft:Radius.circular(300))
                        ),
                      ),
                      Container(
                      padding: EdgeInsets.fromLTRB(60, 30, 60, 70),
                      alignment: AlignmentDirectional.topCenter,
                      height:598,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius:BorderRadius.only(bottomLeft:Radius.circular(290)),
                        gradient: LinearGradient(
                          colors: [
                            Bluecolor.withOpacity(0.6),
                            Bluecolor,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: ImageProfile()),
                          Container(
                            child: TextField(
                              decoration: InputDecoration(
                              label: Text('Name:',style:TextStyle(color: w)),
                                  suffixIcon: Icon(Icons.edit,color: Colors.white,),
                              ),
                              keyboardType: TextInputType.text,
                              style: TextStyle(color: w),
                            ),
                          ),
                          Container(
                            child: TextField(
                              decoration: InputDecoration(
                                label: Text('Time Open:',style:TextStyle(color: w)),
                                  suffixIcon: Icon(Icons.edit,color: Colors.white,),
                              ),
                              keyboardType: TextInputType.datetime,
                              style: TextStyle(color: w),
                            ),
                          ),
                          Container(
                            child: TextField(
                              decoration: InputDecoration(
                                label: Text('Time Close:',style:TextStyle(color: w)),
                                  suffixIcon: Icon(Icons.edit,color: Colors.white,),
                              ),
                              keyboardType: TextInputType.datetime,
                              style: TextStyle(color: w),
                            ),
                          ),
                          Container(
                            child: TextField(
                              decoration: InputDecoration(
                                label: Text('Address:',style:TextStyle(color: w)),
                                  suffixIcon: Icon(Icons.edit,color: Colors.white,),
                              ),
                              keyboardType: TextInputType.url,
                              style: TextStyle(color: w),
                            ),
                          ),
                          Container(
                            child: TextField(
                              decoration: InputDecoration(
                                label: Text('Land Line:',style:TextStyle(color: w)),
                                suffixIcon: Icon(Icons.phone,color: Colors.white,)
                              ),
                              keyboardType: TextInputType.number,
                              style: TextStyle(color: w),
                            ),
                          ),
                          SizedBox(height: 30,),
                          RaisedButton(
                            color: w,
                            padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child:Text('Edit Phone',style: TextStyle(color:b,fontSize: 20,fontWeight: FontWeight.w300),),
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EnterPhone1()),);
                              }),
                        ],
                      ),
                    ),
                    ],
                  ),),
              ]),
            ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {  Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      EnterPhone()),); },
            icon:Icon(Icons.add_rounded,size: 35,),
            label: Text('Add Phone'),
            backgroundColor: Bluecolor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
            ),
          ),

          drawerScrimColor: b.withOpacity(0.4),
          drawer: Drawer(
              child: ListView(
            children: [
              ListTile(
                title: Text(
                  'MAQW MOBIL ^_^',
                  style: TextStyle(fontSize: 40, color: Bluecolor),
                ),
              ),
              ListTile(
                title: Text(
                  "Home",
                  style: TextStyle(fontSize: 25, color: Bluecolor),
                ),
                trailing: Icon(Icons.home),
                onTap: () => selectScreen(context, "home"),
              ),
              ListTile(
                title: Text(
                  "All Phone",
                  style: TextStyle(fontSize: 25, color: Bluecolor),
                ),
                trailing: Icon(Icons.phone_android_rounded),
                onTap: () => selectScreen(context, "allphone"),
              ),
              ListTile(
                title: Text(
                  "Compartion",
                  style: TextStyle(fontSize: 25, color: Bluecolor),
                ),
                trailing: Icon(Icons.phonelink_setup),
                onTap: () => selectScreen(context, "Compartion"),
              ),
              ListTile(
                title: Text(
                  "Contact Us",
                  style: TextStyle(fontSize: 25, color: Bluecolor),
                ),
                trailing: Icon(Icons.email_outlined),
                onTap: () => selectScreen(context, "ContatUs"),
              ),
            ],
          ) // contact_Us(),
              ),
          bottomNavigationBar: NavigationB(),
        )
        ,
    );
  }
  Future<void> signup() async {
    String Url = "";
    Map MyData = {
      'name':  nameController .text,
      'timeopen': TimeOpenController.text,
    'timeclose': TimeCloseController.text,
    'landline': LandLineController.text,
    };
    http.Response response = await http.post(Uri.parse(Url), body: MyData);
    var data = jsonEncode(response.body);
  }
}
