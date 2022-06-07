import 'package:flutter/material.dart';
import 'package:maqw/widget/containericon.dart';
import 'package:maqw/widget/dropbutton.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../main.dart';

class EnterPhone1 extends StatefulWidget {
  const EnterPhone1({Key? key}) : super(key: key);

  @override
  State<EnterPhone1> createState() => _EnterPhone1State();
}

class _EnterPhone1State extends State<EnterPhone1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Center(
            child: Column(
              children: [
                Text(
                  "Enter phone details",
                  style: TextStyle(
                      fontSize: 25, color: orangee, fontWeight: FontWeight.w600,letterSpacing: 2),
                ),
                const SizedBox(
                  height: 60,
                ),
                DropButton(
                  value: "0",
                  hint: "Select size phone",
                  onchange: (newvalue) {
                    setState(() {
                      size = newvalue;
                      getList();
                      print("${size}");
                    });
                  },
                  items: sizeList?.map((item) {
                        return DropdownMenuItem(
                          child: Text(
                            item[0],
                            style: TextStyle(color: bluee),
                          ),
                          value: item[0].toString(),
                        );
                      })?.toList() ??
                      [],
                ),
                const SizedBox(
                  height: 40,
                ),
                DropButton(
                  value: body,
                  hint: "Select body phone",
                  items: bodyList?.map((item) {
                        return DropdownMenuItem(
                          child: Text(
                            item[0],
                            style: TextStyle(color: bluee),
                          ),
                          value: item[0].toString(),
                        );
                      })?.toList() ??
                      [],
                  onchange: (newvalue) {
                    setState(() {
                      body = newvalue;
                      getList();
                      print("${body}");
                    });
                  },
                ),
            const SizedBox(
              height: 40,
            ),
                DropButton(
                  value: resolution,
                  hint: "Select resolution phone",
                  items: resolutionList?.map((item) {
                    return DropdownMenuItem(
                      child: Text(
                        item[0],
                        style: TextStyle(color: bluee),
                      ),
                      value: item[0].toString(),
                    );
                  })?.toList() ??
                      [],
                  onchange: (newvalue) {
                    setState(() {
                      resolution = newvalue;
                      getList();
                      print("${resolution}");
                    });
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                DropButton(
                  value:camera,
                  hint: "Select camera phone",
                  items: cameraList?.map((item) {
                    return DropdownMenuItem(
                      child: Text(
                        item[0],
                        style: TextStyle(color: bluee),
                      ),
                      value: item[0].toString(),
                    );
                  })?.toList() ??
                      [],
                  onchange: (newvalue) {
                    setState(() {
                      resolution = newvalue;
                      getList();
                      print("${camera}");
                    });
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                DropButton(
                  value:camera,
                  hint: "Select ram phone",
                  items: ramList?.map((item) {
                    return DropdownMenuItem(
                      child: Text(
                        item[0],
                        style: TextStyle(color: bluee),
                      ),
                      value: item[0].toString(),
                    );
                  })?.toList() ??
                      [],
                  onchange: (newvalue) {
                    setState(() {
                      ram = newvalue;
                      getList();
                      print("${ram}");
                    });
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                DropButton(
                  value:os,
                  hint: "Select os phone",
                  items: osList?.map((item) {
                    return DropdownMenuItem(
                      child: Text(
                        item[0],
                        style: TextStyle(color: bluee),
                      ),
                      value: item[0].toString(),
                    );
                  })?.toList() ??
                      [],
                  onchange: (newvalue) {
                    setState(() {
                      os = newvalue;
                      getList();
                      print("${os}");
                    });
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                DropButton(
                  value:os,
                  hint: "Select video phone",
                  items: vidioList?.map((item) {
                    return DropdownMenuItem(
                      child: Text(
                        item[0],
                        style: TextStyle(color: bluee),
                      ),
                      value: item[0].toString(),
                    );
                  })?.toList() ??
                      [],
                  onchange: (newvalue) {
                    setState(() {
                      vidio = newvalue;
                      getList();
                      print("${vidio}");
                    });
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                ContainerIconright(onpress: (){
                  Navigator.of(context).pushReplacementNamed('screensalecenter');
                }),
              ],
            ),
          ),
        ),
      ),
    ));
  }
  // variables to drop value
  String size="";
  String body="";
  String os="";
  String resolution ="";
  String camera ="";
  String vidio ="";
  String ram="";

  // api to size phone
  List devices=[];
  Map device={};
  List sizeList = [];
  List bodyList=[];
  List osList=[];
  List resolutionList=[];
  List cameraList=[];
  List vidioList=[];
  List ramList=[];

  Future getList() async {
    String url = "";
   http.Response responseDevices= await http.get(Uri.parse(url));
   if(responseDevices.statusCode==200){
     setState(() {
       devices=convert.jsonDecode(responseDevices.body);
       for(int i=0;i<=devices.length;i++){
         device=devices[i];
         if(device==device['disply_size']){
           sizeList=device['disply_size'];
         }
         else if(device==device['body']){
           bodyList=device['body'];
         }
         else if(device=device['os']){
           osList=device['os'];
         }
         else if(device==device['disply_resolution']){
           resolutionList=device['disply_reolution'];
         }
         else if(device==device['camera_pixsels']){
          cameraList=device['camera_pixsels'] ;
         }
         else if(device=device['vidio_pixsels']){
           vidioList=device['vidio_pixsels'];
         }
         else if(device==device['ram']){
           ramList=device['ram'];
         }
       }
     });

   }
  }

  // // api to body phone
  // List bodyList = [];
  // String body = "";
  //
  // Future getBodyList() async {
  //   String url = "";
  //   await http.post(Uri.parse(url), headers: {
  //     'Content_Type': 'application/x-www-form-urlencoded'
  //   }, body: {
  //     "api_key": '25d55ad283aa400af464c76d713c07ad',
  //   }).then((response) {
  //     var data = convert.jsonDecode(response.body);
  //     setState(() {
  //       sizeList = data['bodies'];
  //     });
  //   });
  // }
  //
  // // api to resolutionlist phone
  // List resolutionList = [];
  // String resolution = "";
  //
  // Future getResolutionList() async {
  //   String url = "";
  //   await http.post(Uri.parse(url), headers: {
  //     'Content_Type': 'application/x-www-form-urlencoded'
  //   }, body: {
  //     "api_key": '25d55ad283aa400af464c76d713c07ad',
  //   }).then((response) {
  //     var data = convert.jsonDecode(response.body);
  //     setState(() {
  //       sizeList = data['resolutions'];
  //     });
  //   });
  // }
  //
  // // api to camera pickles phone
  // List cameraList = [];
  // String camera = "";
  //
  // Future getCameraList() async {
  //   String url = "";
  //   await http.post(Uri.parse(url), headers: {
  //     'Content_Type': 'application/x-www-form-urlencoded'
  //   }, body: {
  //     "api_key": '25d55ad283aa400af464c76d713c07ad',
  //   }).then((response) {
  //     var data = convert.jsonDecode(response.body);
  //     setState(() {
  //       cameraList = data['cameres'];
  //     });
  //   });
  // }
  //
  // // api to ram phone
  // List ramList = [];
  // String ram = "";
  //
  // Future getRamList() async {
  //   String url = "";
  //   await http.post(Uri.parse(url), headers: {
  //     'Content_Type': 'application/x-www-form-urlencoded'
  //   }, body: {
  //     "api_key": '25d55ad283aa400af464c76d713c07ad',
  //   }).then((response) {
  //     var data = convert.jsonDecode(response.body);
  //     setState(() {
  //       cameraList = data['rams'];
  //     });
  //   });
  // }
  //
  // // api to os phone
  // List osList = [];
  // String os = "";
  //
  // Future getOsList() async {
  //   String url = "";
  //   await http.post(Uri.parse(url), headers: {
  //     'Content_Type': 'application/x-www-form-urlencoded'
  //   }, body: {
  //     "api_key": '25d55ad283aa400af464c76d713c07ad',
  //   }).then((response) {
  //     var data = convert.jsonDecode(response.body);
  //     setState(() {
  //       cameraList = data['Os'];
  //     });
  //   });
  // }
  //
  // // api to video pickles phone
  // List videoList = [];
  // String video = "";
  //
  // Future getVideoList() async {
  //   String url = "";
  //   await http.post(Uri.parse(url), headers: {
  //     'Content_Type': 'application/x-www-form-urlencoded'
  //   }, body: {
  //     "api_key": '25d55ad283aa400af464c76d713c07ad',
  //   }).then((response) {
  //     var data = convert.jsonDecode(response.body);
  //     setState(() {
  //       cameraList = data['videos'];
  //     });
  //   });
  // }
}
