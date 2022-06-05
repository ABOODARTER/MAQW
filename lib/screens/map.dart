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


class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  late GoogleMapController googleMapController;

  static late CameraPosition initialCameraPosition = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14,
  );

  // marker to add show client user
  Set<Marker> currentlocation = {};

// marker to show centers
  Set<Marker> centers = {};

  // api to store location user
  Future<void> getlocationuser() async {
    String url = "";
    var location = {
      'currentlatitude': currentlatitude,
      'currentlongitude': currentlongitude,
    };
    http.Response response = await http.post(Uri.parse(url), body: location);
    var data = jsonEncode(response.body);
  }

// variables to store current location
  String currentlatitude = "";
  String currentlongitude = "";

// variables to api _buildContainer
 List allCenters =[];
// Map oneCenter={}as Map;
 String dataCenter="";


  // api to _buildContainer
  Future apiContainer() async {
    String urlC = "";
    http.Response response = await http.get(Uri.parse(urlC));
    if (response.statusCode == 200) {
      setState(() {
       allCenters = jsonDecode(response.body);
        // على حسب الاسم الي مسميه بملف json
    //    oneCenter = allCenters['center'];
        // خزنت التايب تبعو بمتحول مشان اعرف شو نوع المركز واعرض معلوماتو بناءا على نوعو
     //   dataCenter=oneCenter['type'];
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
                  image: 'assets/images/images.jpg',
                  namecenter: "ccssp center",
                  timeopen: '12:00 open',
                  timeclose: '9:00 close',
                  onpress: () {}),
              const SizedBox(
                width: 15,
              ),
              ContainerMap(
                  image: 'assets/images/images.jpg',
                  namecenter: "ccssp center",
                  timeopen: '12:00 open',
                  timeclose: '9:00 close',
                  onpress: () {}),
              const SizedBox(
                width: 15,
              ),
              ContainerMap(
                  image: 'assets/images/images.jpg',
                  namecenter: "ccssp center",
                  timeopen: '12:00 open',
                  timeclose: '9:00 close',
                  onpress: () {}),
           //   to get api
           //    ContainerMap(image: oneCenter==null?Text("load"):Image.asset(oneCenter['image']) as Image,
           //        namecenter: oneCenter==null?Text("load"):Text(oneCenter['name'].toString()),
           //        timeopen: oneCenter==null?Text("load"):Text(oneCenter['time_open'].toString()),
           //        timeclose:oneCenter==null?Text("load"):Text(oneCenter['time_close'].toString()) ,
           //        onpress: () {}),
            ]),
          )
        ]));
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
        _buildContainer(),
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

// api to places
  Future<void> LocationService() async {
    String key = '"AIzaSyD0Iveuotn1GTDmBCC6OojqfKlNVqLaUt0"';

    Future<String> getPlaceId() async {
      String url = '';
      var response = await http.get(Uri.parse(url));
      var json = convert.jsonDecode(response.body);
      var plaseId = json['cnter'][0]['center_id'] as String;

      return plaseId;
    }
    // Future<Map<String,dynamic>> getPlaceId() async{
    //   final plaseId= await getPlaseId();
    //   final String url='';
    //   var response = await http.get(Uri.parse(url));
    //   var json=convert.jsonDecode(response.body);
    //   var results=json['result'] as Map<String,dynamic>;
    //   print (results);
    //   return results;
    //
    // }
  }
}
