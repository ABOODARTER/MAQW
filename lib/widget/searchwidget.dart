import 'dart:async';

import 'package:flutter/material.dart';
import 'package:maqw/main.dart';
import 'package:http/http.dart' as http;
import 'package:maqw/widget/phones_api.dart';
import 'dart:convert';

import 'package:maqw/widget/searchwidget1.dart';

class search extends StatefulWidget {
  const search({Key? key}) : super(key: key);

  @override
  State<search> createState() => searchState();
}

class searchState extends State<search> {
  List <Phone>allphones=[];
  late List<Phone> phones;
  String query = 'http://mobile.test:400/api/search_on_device_in_Seles_Center';
  Timer? debouncer;
  Map dataphoneResponse = {};
  Map bodyResponse = {};
  void initState() {
    super.initState();
    this.phones=allphones;
    init();
    allphones = <Phone>[
    Phone(
    id: 1,
    brand:  dataphoneResponse['name'].toString(),
    name: dataphoneResponse['name'].toString(),
    phoneimage: dataphoneResponse['picture'].toString(),
    ),
      Phone(
        id: 2,
        brand:  dataphoneResponse['name'].toString(),
        name: dataphoneResponse['name'].toString(),
        phoneimage: dataphoneResponse['picture'].toString(),
      ),
      Phone(
        id: 3,
        brand:  dataphoneResponse['name'].toString(),
        name: dataphoneResponse['name'].toString(),
        phoneimage: dataphoneResponse['picture'].toString(),
      ),
    ];
  }
  @override
  void dispose(){
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
      Duration duration=const Duration(milliseconds: 1000),
}){
    if(debouncer!=null){
   debouncer!.cancel();
    }
    debouncer=Timer(duration, callback);
  }
  Future init() async{
    final phones=await PhonesApi.getPhones(query);
    setState((){
      this.phones=phones;
      this.query=query;
    }
    );
  }
  Future apicall() async {
    http.Response response;
    //here i put request url
    response = await http
        .get(Uri.parse("http://mobile.test:400/api/search_on_material_device"));
    if (response.statusCode == 200) {
      setState(() {
        bodyResponse = json.decode(response.body);
        dataphoneResponse = bodyResponse['body'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('search'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          buildSearch(),
          Expanded(
            child: ListView.builder(
                itemCount: phones.length,
                itemBuilder: (context, index) {
                  final phone = phones[index];
                  return buildPhone(phone);
                }),
          ),
        ],
      ),

    );
  }

  Widget buildPhone(Phone phone)=>ListTile(
    leading:Image.asset(phone.phoneimage,fit:BoxFit.cover,
    width: 50,
    height: 50,),
    title:Text(phone.name),
    subtitle: Text(phone.brand),
  );


 Widget buildSearch() =>searchWidget(
   text:query,
   onChanged: searchPhone,
    hintText: 'Enter Phone Name',
 );
  void searchPhone(String query) async=> debounce(() async {
    final phones=await PhonesApi.getPhones(query);
    if(!mounted)return;
    setState((){
      this.query=query;
      this.phones=phones;
    });
  });
}

class Phone {
  final int id;
  final String name;
  final String brand;
  final String phoneimage;

  const Phone(
      {required this.id,
      required this.brand,
      required this.name,
      required this.phoneimage});

  factory Phone.fromJson(json)=>Phone(id: json['id'], brand: json['name'], name: json['name'], phoneimage: json['picture']);
//    Map<String,dynamic>toJson()=>{
//
// }

}

