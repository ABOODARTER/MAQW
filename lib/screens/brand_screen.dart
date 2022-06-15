

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:maqw/screens/AllPhone.dart';
import '../widget/navigationbottom.dart';
import 'Colors.dart';

class BrandScreen extends StatefulWidget {
  const BrandScreen({Key? key}) : super(key: key);

  @override
  State<BrandScreen> createState() => _BrandScreenState();
}

class _BrandScreenState extends State<BrandScreen> {

  List brands = [];
  bool loading = false;

  void getAllBrands()async{
    setState((){
      loading = true;
    });
    Map<String,String>? headers ={
      'Accept': 'application/json',
      'Authorization': 'Bearer RXmKRnnKPdCIwZhwWoRrHDpGxbOgnbGJoRXqQrsq'
    };
    http.Response response = await http.get(Uri.parse("http://10.2.0.2:48608/api/return_brand"),headers: headers,);
    brands = jsonDecode(response.body)['brand'];
    print(brands);
    setState((){
      loading = false;
    });
  }

  @override
  initState(){
    super.initState();
    getAllBrands();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:const NavigationB(),
      appBar: AppBar(
        title: const Text("Brands",style: TextStyle(color: Colors.white)),
        backgroundColor: Bluecolor,

      ),
      body:  loading?const Center(child: CircularProgressIndicator(color: Colors.blue,)):SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: brands.length,
              itemBuilder: (context,index)=>InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>allPhone(phone_id:brands[index]['id'].toString() ,)));
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 1,
                      spreadRadius: 1
                    )]
                  ),

                  child: Text(brands[index]['name'],
                  style: const TextStyle(
                    fontSize: 20
                  ),),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
