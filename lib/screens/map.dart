import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maqw/main.dart';
import 'package:geolocator/geolocator.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  late GoogleMapController googleMapController;

  static late CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962), zoom: 14);

  // marker to add show client user
  Set <Marker>currentlocation={};

static final Markers = Marker(
    markerId: MarkerId('Locationcurrent1'),
  position: LatLng(37.42796133580664, -122.085749655962),
  infoWindow: InfoWindow(title:"Default Location"),
  icon: BitmapDescriptor.defaultMarker,
);
Widget _buildContainer(){
  return Align(
    alignment: Alignment.bottomLeft,
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(width: 30,),
          Padding(padding: EdgeInsets.all(8.0)),
        ],
      ),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Map",
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          GoogleMap(
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            initialCameraPosition: initialCameraPosition,
            mapType: MapType.normal,
            onMapCreated: (GoogleMapController controle) {
              googleMapController = controle;
            },
            markers: currentlocation,
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(children: [
              Text(
                "Center near\nthe city of Damascus",
                style: TextStyle(
                  fontSize: 30,
                  color: bluee,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              // Text("Find the nearest.\n sales and maintenance\n center")
            ]),
          ),

          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //
          //     Container(
          //       margin: EdgeInsets.only(
          //         left: 120,
          //         top: 340,
          //       ),
          //       child: ElevatedButton(
          //           style: ElevatedButton.styleFrom(
          //               onPrimary: Colors.white,
          //               primary: bluee,
          //               padding:
          //               EdgeInsets.symmetric(vertical: 5, horizontal: 50),
          //               textStyle: TextStyle(
          //                 fontSize: 23,
          //                 fontWeight: FontWeight.w600,
          //               )),
          //           onPressed: () {
          //
          //             Navigator.of(context).pushNamed('map2');
          //           },
          //           child: Text("Start")),
          //     ),
          //   ],
          // ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: bluee,
        onPressed: () async {
          Position ?position = await _determineposition();
          print('${position.latitude.toString()}');
          print('${position.longitude.toString()}');
          googleMapController.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                  target: LatLng(position.latitude, position.longitude),
                  zoom: 14,
              )));

         currentlocation.clear();
          currentlocation.add(Marker(
              markerId: MarkerId('Locationcurrent'),
              position: LatLng(position.latitude, position.longitude),
              infoWindow: InfoWindow(title:"My current location"),
               icon: BitmapDescriptor.defaultMarker,
          ),
          );
       },
                    label: Text("location current",style: TextStyle(fontSize: 15),),
                    icon: Icon(Icons.location_history),
       ),
    );
  }

  Future<Position> _determineposition() async {
    // variable to have client Gps
    bool ServiceEnabled;
    // variable to allow application to Access to place client
    LocationPermission permission;
    ServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!ServiceEnabled) {
      Fluttertoast.showToast(msg: "Location Services are disabled");
      //  return Future.error("Location Services are disabled");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: "you denied the permission");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(msg: "yoy denied the permission forever");
    }
    Position? currentposition = await Geolocator.getCurrentPosition();
    return currentposition;
  }
}