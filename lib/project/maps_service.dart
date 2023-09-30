import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsServices extends StatefulWidget {
  @override
  State<MapsServices> createState() => _RouteWhereYouGo2State();
}

class _RouteWhereYouGo2State extends State<MapsServices> {
  var myMarkers = HashSet<Marker>();

  Completer<GoogleMapController> _controller = Completer();

  CameraPosition _kGooglePlex;

  Position curLoc;

  var lat;

  var long;

  StreamSubscription<Position> ps;

  Future getPostion() async {
    bool services;
    LocationPermission per;
    services = await Geolocator.isLocationServiceEnabled();
    per = await Geolocator.checkPermission();
    if (per == LocationPermission.denied) {
      per = await Geolocator.requestPermission();
    }
    return per;
  }



  Future<Position> getlatAndLong() async {
    curLoc = await Geolocator.getCurrentPosition().then((value) => value);
    lat = curLoc.latitude;
    long = curLoc.longitude;
    Set<Marker> myMarker;
    _kGooglePlex = CameraPosition(
      target: LatLng(lat, long),
      zoom: 14.4746,
    );
    setState(() {});

  }

  Set<Marker> myMarker = {
  Marker(
  markerId: MarkerId("1"),
  position: LatLng(30.272055, 35.676574),
  infoWindow: InfoWindow(title: 'My Location')),
    Marker(
        markerId: MarkerId('2'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        position: LatLng(30.255701, 35.685063),
        infoWindow: InfoWindow(
            title: 'Towing Service', snippet: '0789999999', onTap: () {})),
    Marker(
        markerId: MarkerId('3'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        position: LatLng(30.258815, 35.673565),
        infoWindow: InfoWindow(title: 'Towing Service', snippet: '0779999951')),
    Marker(
        markerId: MarkerId('4'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        position: LatLng(30.258815, 35.673565),
        infoWindow: InfoWindow(title: 'Towing Service', snippet: '0799999621')),
    Marker(
        markerId: MarkerId('5'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        position: LatLng(30.268230, 35.697763),
        infoWindow: InfoWindow(title: 'Towing Service', snippet: '0789999741')),
    Marker(
        markerId: MarkerId('6'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        position: LatLng(30.235741, 35.693900),
        infoWindow: InfoWindow(title: 'Towing Service', snippet: '0789999354')),
    Marker(
        markerId: MarkerId('7'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        position: LatLng(30.226620, 35.737224),
        infoWindow: InfoWindow(title: 'Towing Service', snippet: '0779999897')),
    Marker(
        markerId: MarkerId('8'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        position: LatLng(30.277348, 35.663283),
        infoWindow: InfoWindow(title: 'Service', snippet: '0789999527')),
    Marker(
        markerId: MarkerId('9'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        position: LatLng(30.245974, 35.687875),
        infoWindow: InfoWindow(title: 'Service', snippet: '0789999671')),
    Marker(
        markerId: MarkerId('10'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        position: LatLng(30.273701, 35.692011),
        infoWindow: InfoWindow(title: 'Service', snippet: '0789999665')),
    Marker(
        markerId: MarkerId('11'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        position: LatLng(30.271477, 35.667433),
        infoWindow: InfoWindow(title: 'Service', snippet: '0789412869')),
    Marker(
        markerId: MarkerId('12'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        position: LatLng(30.260728, 35.678485),
        infoWindow: InfoWindow(title: 'Service', snippet: '0787452179')),
    Marker(
        markerId: MarkerId('13'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        position: LatLng(30.239167, 35.692043),
        infoWindow: InfoWindow(title: 'Service', snippet: '0784199928')),
  };

  @override
  Widget build(BuildContext context) {
    ps = Geolocator.getPositionStream().listen((Position position) {});
    getPostion();
    getlatAndLong();
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                width: 850,
                height: 850,
                child: GoogleMap(
                  scrollGesturesEnabled: true,
                  myLocationEnabled: false,
                  compassEnabled: false,
                  tiltGesturesEnabled: false,
                  markers: myMarker,
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                      target: LatLng(30.258489, 35.684811), zoom: 14),
                  onMapCreated: (GoogleMapController controller) {
                    setState(() {
                      myMarkers.add(
                        Marker(
                          markerId: MarkerId('1'),
                          position: LatLng(30.258489, 35.684811),
                        ),
                      );
                    });
                  },
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
