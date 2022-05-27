import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Map2 extends StatefulWidget {
  const Map2({Key? key}) : super(key: key);

  @override
  State<Map2> createState() => _Map2State();
}

class _Map2State extends State<Map2> {
  bool _MapCreate = false;
  late GoogleMapController googleMapController;
  static const CameraPosition initiolCameraPosition = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962), zoom: 14);
  Set<Marker> Markers = {};
  Position? position;

  onMapCreated(GoogleMapController controller) {
    googleMapController = controller;
    setState(() {
      _MapCreate = true;
    });
  }

  getLocation() async {
  //  position = await _determineposition();
    onMapCreated(googleMapController).animateCamera(
        CameraUpdate.newCameraPosition(CameraPosition(
            target: LatLng(position!.latitude, position!.longitude))));
    Markers.clear();
    Markers.add(Marker(
        markerId: MarkerId('Locationcurrent'),
        position: LatLng(position!.latitude, position!.longitude),
        infoWindow: InfoWindow(title: "My current location")));
  }

  @override
  void dispose() {
    googleMapController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "map2",
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            GoogleMap(
                initialCameraPosition: initiolCameraPosition,
                markers: Markers,
                zoomControlsEnabled: false,
                mapType: MapType.normal,
                onMapCreated: onMapCreated),
            if (!_MapCreate) const Center(child: CircularProgressIndicator())
          ],
        ));
  }


}
