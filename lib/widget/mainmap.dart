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
        width: 391.81,
        height: 200,
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
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  child: Center(
                    child: Text(
                        "You Can Search For The Nearest\nSales Centers Or The Nearest\nSales And Maintenance\nCenters Or\nMaintenance Centers, Then You\nCan Access The Details Of Each\nSelected Center\n",
                      style: TextStyle(color: bluee,fontSize: 16),
                    ),
                  ),
                ),
               // SizedBox(width: ,),
                Image.asset('assets/images/map.jpg',width: 120,height: 136,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
