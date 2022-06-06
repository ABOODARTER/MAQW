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
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  late List<Phone> phones;
  String query = '';
  Timer? debouncer;

  void initState() {
    super.initState();
    this.phones=allphones;
    init();
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
    });
  }


  final allphones = <Phone>[
    Phone(
      id: 1,
      brand: 'sumsang',
      name: 'sumsang Not 9 pro',
      phoneimage: 'assets/images/compartion/battery (1).png',
    ),
    Phone(
      id: 2,
      brand: 'Redmi',
      name: 'Redmi Not 9 pro',
      phoneimage: 'assets/images/compartion/battery (1).png',
    ),
    Phone(
      id: 3,
      brand: 'Apple',
      name: 'Apple Not 9 pro',
      phoneimage: 'assets/images/compartion/battery (1).png',
    ),
  ];

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
   hitText:'Name or Brand ',
       onChanged: searchPhone, hintText: '',
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

  factory Phone.fromJson(Map<String,dynamic>json)=>Phone(id: json['id'], brand: json['brand'], name: json['name'], phoneimage: json['phoneimage']);
//    Map<String,dynamic>toJson()=>{
//
// }

}
