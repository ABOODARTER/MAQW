import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maqw/main.dart';
import 'package:geolocator/geolocator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:maqw/widget/containermap.dart';


class MainMap extends StatefulWidget {
  const MainMap({Key? key}) : super(key: key);

  @override
  State<MainMap> createState() => _MainMapState();
}

class _MainMapState extends State<MainMap> {
  late GoogleMapController googleMapController;

  static late CameraPosition initialCameraPosition = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14,
  );


  // marker to add show client user
  Set<Marker> currentlocation = {};

 // marker to show saleCenters
  Set<Marker> saleCenters = {};

 // marker to show mCenters
 Set<Marker> mCenters ={};

  // api to store location user
  Future<void> getlocationuser() async {
    String url = "";
    Map location = {
      'currentlatitude': currentlatitude,
      'currentlongitude': currentlongitude,
    };
    http.Response response = await http.post(Uri.parse(url), body: location);
    var currentLocationUser = jsonEncode(response.body);
    
  }


// variables to store current location
  String currentlatitude = "";
  String currentlongitude = "";

// variables to api _buildContainer
 List allCenters =[];
 Map center={};
 String dataCenter="";
  Map requiredCenterS={};
  Map requiredCenterM={};


  // api to _buildContainer
  Future apiContainer() async {
    String urlC = "";
    http.Response response = await http.get(Uri.parse(urlC));
    if (response.statusCode == 200) {
      setState(() {
       allCenters = jsonDecode(response.body);
       for (int i = 0; i < allCenters.length; i++) {
         center=allCenters[i];
         dataCenter=center['type'];
         if(dataCenter=="Sales Center"){
           requiredCenterS=allCenters[i];
         }
         else if(dataCenter=="maintenance center"){
           requiredCenterM=allCenters[i];
         }
       }
      });
    }
  }
  // Api places
String urlPlaces ="";
List places3 =[];
Map place1={};
Map place2={};
Map place3={};
Future getPlaces()async{
  http.Response responseP =await http.get(Uri.parse(urlPlaces));
  if(responseP.statusCode==200){
    setState(() {
      places3=jsonDecode(responseP.body);
      place1=places3[0];
      place2=places3[1];
      place3=places3[2];
    });

  }
}

// container to show details center
  Widget _buildContainer() {
    return Align(
        alignment: Alignment.bottomLeft,
        child: Stack(children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            height: 200,
            child: ListView(scrollDirection: Axis.horizontal, children: [
              ContainerMap(
                  image:place1==null?Text("load"): place1['image'],
                  namecenter:place1==null?Text("load") :place1['name'],
                  timeopen:place1==null?Text("load"): place1['time_open'],
                  timeclose:place1==null?Text("load"): place1['time_close'],
                  onpress: () {}),
              const SizedBox(
                width: 15,
              ),
              ContainerMap(
                  image:place2==null?Text("load"): place2['image'],
                  namecenter:place2==null?Text("load"): place2['name'] ,
                  timeopen:place2==null?Text("load"): place2['time_open'],
                  timeclose: place2==null?Text("load"): place2['time_close'],
                  onpress: () {}),
              const SizedBox(
                width: 15,
              ),
              ContainerMap(
                  image:place3==null?Text("load"): place3['image'],
                  namecenter:place3==null?Text("load"): place3['name'] ,
                  timeopen:place3==null?Text("load"): place3['time_open'],
                  timeclose: place3==null?Text("load"): place3['time_close'],
                  onpress: () {}),
            ]),
          )
        ]));
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiContainer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Map",
        ),
        centerTitle: true,
      ),
      body: Stack(children: [
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
        Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "Center near\nthe city of Damascus",
              style: TextStyle(
                fontSize: 30,
                color: bluee,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 320,
            ),
            decoration: ShapeDecoration(
              color: orangee,
              shape: const CircleBorder(),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.location_history,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () async {
                Position position = await _determineposition();
                setState(() {
                  print('${position.latitude.toString()}');
                  print('${position.longitude.toString()}');
                  currentlatitude = position.latitude.toString();
                  currentlongitude = position.longitude.toString();
                  getlocationuser();
                  googleMapController.animateCamera(
                      CameraUpdate.newCameraPosition(CameraPosition(
                    target: LatLng(position.latitude, position.longitude),
                    zoom: 14,
                  )));

                  currentlocation.clear();
                  currentlocation.add(
                    Marker(
                      markerId: const MarkerId('Location current'),
                      position: LatLng(position.latitude, position.longitude),
                      infoWindow:
                          const InfoWindow(title: "My current location"),
                      icon: BitmapDescriptor.defaultMarker,
                    ),
                  );
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 320, top: 30),
            child: Container(
              decoration: ShapeDecoration(
                color: orangee,
                shape: const CircleBorder(),
              ),
              child: IconButton(
                icon: const Icon(
                CupertinoIcons.wrench_fill,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () async {
                  Position latitude1=place1["latitude"];
                  Position longitude1 =place1["longitude"];
                  googleMapController.animateCamera(
                      CameraUpdate.newCameraPosition(CameraPosition(
                          target: LatLng(latitude1.latitude, longitude1.longitude),
                      )));
                  mCenters.clear();
                  mCenters.add(
                    Marker(
                      markerId: const MarkerId('Center one'),
                      position: LatLng(latitude1.latitude, longitude1.longitude),
                      icon: BitmapDescriptor.defaultMarker,
                    ),
                  );
                  await dataCenter=='maintenance center'?_buildContainer():null;
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 320, top: 30),
            child: Container(
              decoration: ShapeDecoration(
                color: orangee,
                shape: const CircleBorder(),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.business_center,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: ()async{
                await dataCenter=='sale center'||dataCenter=='maintenance center'?_buildContainer():null;
                },
              ),
            ),
          ),
        ]),

      ]),
    );
  }

  // to determine current location
  Future<Position> _determineposition() async {
    // variable to have client Gps
    bool serviceEnabled;
    // variable to allow application to Access to place client
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
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
    Position currentposition = await Geolocator.getCurrentPosition();
    return currentposition;
  }

}
