import 'dart:async';

import 'package:flutter/material.dart';
import 'package:maqw/main.dart';
import 'package:http/http.dart' as http;
import 'package:maqw/widget/phones_api.dart';
import 'dart:convert';

import 'package:maqw/widget/searchwidget1.dart';

import '../screens/Compartion.dart';

class search extends StatefulWidget {
  final double getFrom;
  final String oldId;

  const search({Key? key, this.getFrom = 0,this.oldId='0'}) : super(key: key);

  @override
  State<search> createState() => searchState();
}

class searchState extends State<search> {

  List<Phone> allphones = [];
  late List<Phone> phones;
  String query = 'http://10.2.0.2:48608/api/search_name_device_comper';
  Timer? debouncer;
  Map dataphoneResponse = {};
  Map bodyResponse = {};

//
  TextEditingController searchController = TextEditingController();
  List result = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                icon: const Icon(Icons.search, color: Colors.black),
                suffixIcon: GestureDetector(
                  child: const Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                  onTap: () {
                    searchController.clear();
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                ),
                hintText: 'search',
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
              ),
              controller: searchController,
              onFieldSubmitted: (value) async {
                Map<String, String>? header = {
                  'Accept': 'application/json',
                  'Authorization': 'Bearer GSo8LL92AmqcdkhB3JwjGxdD9D7G6yQJ96BVQKWm'
                };
                http.Response respone = await http.post(Uri.parse(
                    "http://10.2.0.2:48608/api/search_name_device_comper"),
                    headers: header, body: {'name': searchController.text});
                setState(() {
                  result = jsonDecode(respone.body);
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: result.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) =>
                            widget.getFrom == 1
                                ? compartion(phoneid1:result[index]['id'].toString(),phoneid2: widget.oldId,):compartion(phoneid2:result[index]['id'].toString() ,phoneid1:  widget.oldId,))
                        );
                      },
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Text(result[index]['name'], style: const TextStyle(
                              fontSize: 18
                          ),),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget buildPhone(Phone phone) =>
      ListTile(
        leading: Image.asset(
          phone.phoneimage,
          fit: BoxFit.cover,
          width: 50,
          height: 50,
        ),
        title: Text(phone.name),
        subtitle: Text(phone.brand),
      );

  Widget buildSearch() =>
      searchWidget(
        text: query,
        onChanged: (v) {},
        hintText: 'Enter Phone Name',
      );
// void searchPhone(String query) async=> debounce(() async {
//   final phones=await PhonesApi.getPhones(query);
//   if(!mounted)return;
//   setState((){
//     this.query=query;
//     this.phones=phones;
//   });
// });
}

class Phone {
  final int id;
  final String name;
  final String brand;
  final String phoneimage;

  const Phone({required this.id,
    required this.brand,
    required this.name,
    required this.phoneimage});

  factory Phone.fromJson(json) =>
      Phone(
          id: json['id'],
          brand: json['name'],
          name: json['name'],
          phoneimage: json['picture']);
//    Map<String,dynamic>toJson()=>{
//
// }

}
