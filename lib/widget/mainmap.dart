import 'package:flutter/material.dart';

import '../main.dart';

class MainMap extends StatefulWidget {
  const MainMap({Key? key}) : super(key: key);

  @override
  State<MainMap> createState() => _MainMapState();
}

class _MainMapState extends State<MainMap> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed('map'),
      child: Container(
        width:MediaQuery.of(context).size.height * 0.7,
        height: MediaQuery.of(context).size.height * 0.3,
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
            ListView(
              scrollDirection:Axis.horizontal ,
              children: [
                Row(
                  children: [
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: Center(
                        child: Text(
                          "You Can Search For The Nearest\nSales Centers Or The Nearest\nSales And Maintenance\nCenters Or\nMaintenance Centers, Then You\nCan Access The Details Of Each\nSelected Center\n",
                          style: TextStyle(color: bluee, fontSize: 18),
                        ),
                      ),
                    ),
                   const SizedBox(width: 5,),
                    Image.asset(
                      'assets/images/map.jpg',
                      width: MediaQuery.of(context).size.height * 0.2,
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                  ],
                ),
              ],

            )
          ],
        ),
      ),
    );
  }
}
