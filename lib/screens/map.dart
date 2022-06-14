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
  Set<Marker> mCenters = {};

// variables to store current location
  String currentlatitude = "";
  String currentlongitude = "";

// variables to api _buildContainer
  List allCenters = [];
  Map center = {};
  String dataCenter = "";
  Map requiredCenterS = {};
  Map requiredCenterM = {};

  // api to show places
  Future<void> getlocationPlaces() async {
    String url = "";
    Map location = {
      'currentlatitude': currentlatitude,
      'currentlongitude': currentlongitude,
    };
    http.Response response = await http.post(
        Uri.parse("http://localhost:8000/api/search_in_map"),
        body: location);
    http.Response responsePlaces =
        await http.get(Uri.parse("http://localhost:8000/api/centers"));
    if (response.statusCode == 200) {
      setState(() {
        allCenters = jsonDecode(response.body);
        for (int i = 0; i < allCenters.length; i++) {
          center = allCenters[i];
          dataCenter = center['type'];
          if (dataCenter == "Sales Center") {
            requiredCenterS = allCenters[i];
          } else if (dataCenter == "maintenance center") {
            requiredCenterM = allCenters[i];
          }
        }
      });
    }
  }

// container to show details sale center
  Widget _buildContainerSale() {
    return Align(
        alignment: Alignment.bottomLeft,
        child: Stack(children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            height: 200,
            child: ListView(scrollDirection: Axis.horizontal, children: [
              ContainerMap(
                  image: requiredCenterS == null
                      ?const Text("load")
                      : requiredCenterS[0]['image'],
                  namecenter: requiredCenterS == null
                      ?const Text("load")
                      : requiredCenterS[0]['name'],
                  timeopen: requiredCenterS == null
                      ?const Text("load")
                      : requiredCenterS[0]['time_open'],
                  timeclose: requiredCenterS == null
                      ?const Text("load")
                      : requiredCenterS[0]['time_close'],
                  onpress: () {}),
              const SizedBox(
                width: 15,
              ),
              ContainerMap(
                  image: requiredCenterS == null
                      ?const Text("load")
                      : requiredCenterS[1]['image'],
                  namecenter: requiredCenterS == null
                      ?const Text("load")
                      : requiredCenterS[1]['name'],
                  timeopen: requiredCenterS == null
                      ?const Text("load")
                      : requiredCenterS[1]['time_open'],
                  timeclose: requiredCenterS == null
                      ?const Text("load")
                      : requiredCenterS[1]['time_close'],
                  onpress: () {}),
              const SizedBox(
                width: 15,
              ),
              ContainerMap(
                  image: requiredCenterS == null
                      ?const Text("load")
                      : requiredCenterS[2]['image'],
                  namecenter: requiredCenterS == null
                      ?const Text("load")
                      : requiredCenterS[2]['name'],
                  timeopen: requiredCenterS == null
                      ?const Text("load")
                      : requiredCenterS[2]['time_open'],
                  timeclose: requiredCenterS == null
                      ?const Text("load")
                      : requiredCenterS[2]['time_close'],
                  onpress: () {}),
            ]),
          )
        ]));
  }

 // container to show details  center
  Widget _buildContainerM() {
    return Align(
        alignment: Alignment.bottomLeft,
        child: Stack(children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            height: 200,
            child: ListView(scrollDirection: Axis.horizontal, children: [
              ContainerMap(
                  image: requiredCenterM == null
                      ?const Text("load")
                      : requiredCenterM[0]['image'],
                  namecenter: requiredCenterM == null
                      ?const Text("load")
                      : requiredCenterM[0]['name'],
                  timeopen: requiredCenterM == null
                      ?const Text("load")
                      : requiredCenterM[0]['time_open'],
                  timeclose: requiredCenterM == null
                      ?const Text("load")
                      : requiredCenterM[0]['time_close'],
                  onpress: () {}),
              const SizedBox(
                width: 15,
              ),
              ContainerMap(
                  image: requiredCenterM == null
                      ?const Text("load")
                      : requiredCenterM[1]['image'],
                  namecenter: requiredCenterM == null
                      ?const Text("load")
                      : requiredCenterM[1]['name'],
                  timeopen: requiredCenterM == null
                      ?const Text("load")
                      : requiredCenterM[1]['time_open'],
                  timeclose: requiredCenterM == null
                      ?const Text("load")
                      : requiredCenterM[1]['time_close'],
                  onpress: () {}),
              const SizedBox(
                width: 15,
              ),
              ContainerMap(
                  image: requiredCenterM == null
                      ?const Text("load")
                      : requiredCenterM[2]['image'],
                  namecenter: requiredCenterM == null
                      ?const Text("load")
                      : requiredCenterM[2]['name'],
                  timeopen: requiredCenterM == null
                      ?const Text("load")
                      : requiredCenterM[2]['time_open'],
                  timeclose: requiredCenterM == null
                      ?const Text("load")
                      : requiredCenterM[2]['time_close'],
                  onpress: () {}),
            ]),
          )
        ]));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getlocationPlaces();
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
        Column(
            children: [
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
                  currentlatitude = position.latitude.toString();
                  currentlongitude = position.longitude.toString();
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
                  Icons.business_center,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () async {
                  Position latitude1 = requiredCenterS[0]["latitude"];
                  Position longitude1 = requiredCenterS[0]["longitude"];
                  Position latitude2 = requiredCenterS[1]["latitude"];
                  Position longitude2 = requiredCenterS[1]["longitude"];
                  Position latitude3 = requiredCenterS[2]["latitude"];
                  Position longitude3 = requiredCenterS[2]["longitude"];
                  saleCenters.clear();
                  saleCenters.add(
                    Marker(
                      markerId: const MarkerId('Center one'),
                      position:
                          LatLng(latitude1.latitude, longitude1.longitude),
                      icon: BitmapDescriptor.defaultMarker,
                    ),
                  );
                  saleCenters.add(
                    Marker(
                      markerId: const MarkerId('Center two'),
                      position:
                          LatLng(latitude2.latitude, longitude2.longitude),
                      icon: BitmapDescriptor.defaultMarker,
                    ),
                  );
                  saleCenters.add(
                    Marker(
                      markerId: const MarkerId('Center three'),
                      position:
                          LatLng(latitude3.latitude, longitude3.longitude),
                      icon: BitmapDescriptor.defaultMarker,
                    ),
                  );
                  _buildContainerSale();
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
                  CupertinoIcons.wrench_fill,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () async {
                  Position latitude1 = requiredCenterM[0]["latitude"];
                  Position longitude1 = requiredCenterM[0]["longitude"];
                  Position latitude2 = requiredCenterM[1]["latitude"];
                  Position longitude2 = requiredCenterM[1]["longitude"];
                  Position latitude3 = requiredCenterM[2]["latitude"];
                  Position longitude3 = requiredCenterM[2]["longitude"];
                  mCenters.clear();
                  saleCenters.add(
                    Marker(
                      markerId: const MarkerId('Center one'),
                      position:
                          LatLng(latitude1.latitude, longitude1.longitude),
                      icon: BitmapDescriptor.defaultMarker,
                    ),
                  );
                  mCenters.add(
                    Marker(
                      markerId: const MarkerId('Center two'),
                      position:
                          LatLng(latitude2.latitude, longitude2.longitude),
                      icon: BitmapDescriptor.defaultMarker,
                    ),
                  );
                  mCenters.add(
                    Marker(
                      markerId: const MarkerId('Center three'),
                      position:
                          LatLng(latitude3.latitude, longitude3.longitude),
                      icon: BitmapDescriptor.defaultMarker,
                    ),
                  );
                  _buildContainerM();
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
