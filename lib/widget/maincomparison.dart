import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../main.dart';

class MainComparison extends StatefulWidget {
  const MainComparison({Key? key}) : super(key: key);

  @override
  State<MainComparison> createState() => _MainComparisonState();
}

class _MainComparisonState extends State<MainComparison> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 391.81,
      height: 160.91,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 15,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Image.asset('assets/images/phonec.png'),
                  const SizedBox(
                    width: 35,
                  ),
                  Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: bluee,
                      ),
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed('compartion');
                          },
                          child: const Text(
                            "vs",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 20),
                          ),
                        ),
                      )),
                  const SizedBox(
                    width: 40,
                  ),
                  Image.asset('assets/images/phonec.png'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: InkWell(
                      onTap: () => Navigator.of(context).pushNamed('allphone'),
                      child: const Text(
                        "Add a phone",
                        style: TextStyle(color: Colors.grey, fontSize: 17),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: InkWell(
                      onTap: () => Navigator.of(context).pushNamed('allphone'),
                      child: const Text(
                        "Add a phone",
                        style: TextStyle(color: Colors.grey, fontSize: 17),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Map devices = {};
  Map dataDevice = {};

  Future getPhoneInformation() async {
    String url = "";
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setState(() {
        devices = jsonDecode(response.body);
        dataDevice=devices['id_device'];
      });
    }
  }
}
