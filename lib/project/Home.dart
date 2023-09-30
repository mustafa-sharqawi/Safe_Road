import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:youtube/drawer/drawer_guest.dart';
import 'maps_service.dart';
import 'package:http/http.dart' as http;

class Emergency extends StatefulWidget {
  @override
  _MyCustomUIState createState() => _MyCustomUIState();
}

class _MyCustomUIState extends State<Emergency>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  Animation<double> _animation2;
  GlobalKey<ScaffoldState> _keyDrawer = GlobalKey();
  Position c1;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    _animation2 = Tween<double>(begin: 0, end: -30)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _keyDrawer,
      drawer: DrawerGuest(),
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: AppBar(
              leading: GestureDetector(
                  onTap: () {
                    _keyDrawer.currentState.openDrawer();
                  },
                  child: Icon(
                    Icons.menu,
                    color: Colors.white,
                  )),
              brightness: Brightness.dark,
              backgroundColor: Colors.white.withOpacity(.05),
              elevation: 0,
              title: Center(
                child: Text(
                  'Safe Road',
                  style: TextStyle(
                    fontSize: _w / 17,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              actions: [
                Image(
                  image: AssetImage('images/Logo.jpg'),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey[600],
      body: Container(
        child: Stack(
          children: [
            ListView(
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              children: [
                cardsGroup(
                  'Service',
                  'Towing car',
                  Icons.electric_car,
                  Icons.add_alert_sharp,
                  MapsServices(),
                  MapSample(),
                ),
                SizedBox(height: _w / 13),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget cardsGroup(String title1, String title2, IconData icon1,
      IconData icon2, Widget route1, Widget route2) {
    double _w = MediaQuery.of(context).size.width;
    return Opacity(
      opacity: _animation.value,
      child: Transform.translate(
        offset: Offset(0, _animation2.value),
        child: Container(
          margin: EdgeInsets.fromLTRB(_w / 25, _w / 25, _w / 25, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              cardWidget(title1, icon1, route1),
              cardWidget(title2, icon2, route2),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardWidget(String title, IconData icon, Widget route) {
    double _w = MediaQuery.of(context).size.width;
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        HapticFeedback.lightImpact();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return route;
            },
          ),
        );
      },
      child: Container(
        height: _w / 2,
        width: _w / 2.28,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              color: Colors.blueGrey[700].withOpacity(.8),
              size: 40,
            ),
            Text(
              title,
              maxLines: 4,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                  fontWeight: FontWeight.w900),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  List<Marker> allMarkers = [];
  var locationMessage = '';
  var latitude;
  var longitude;
  var currentlocation;
  var geolocator = Geolocator();
  Position curretntposition;

  locateposition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      // curretntposition = position;
      // currentlocation = curretntposition.latitude.toString() +
      //     "," +
      //     curretntposition.longitude.toString();
      // latitude = curretntposition.latitude;
      // longitude = curretntposition.longitude;
      allMarkers.addAll(allMarkers);
    });

    AllLocation();
  }

  Future<List<Location>> AllLocation() async {
//problem in api not in code ..problem here fix it then all thing right
    var url = Uri.parse('http://10.0.2.2:8000/safe_road/latlong.php');
    final response = await http.get(url);

    var data = json.decode(response.body);
    var list = data['data'] as List;

    for (final dnn in list) {
      var long = double.parse(dnn['long']);
      var lat = double.parse(dnn['lat']);
      Marker x = Marker(
        markerId: MarkerId('1'),
        draggable: true,
        position: LatLng(lat, long),
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(title: 'location'),
        consumeTapEvents: true,
      );
      allMarkers.add(x);
    }
    print(allMarkers.length);
  }

  final Set<Marker> markers = new Set();
  String name_ar, lat_location, long_location, place_category_id;

  callmethod() async {
    await locateposition();
  }

  @override
  void initState() {
    callmethod();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
      zoomControlsEnabled: true,
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: LatLng(30.268556, 35.681690),
        zoom: 15,
      ),
      markers: allMarkers.map((e) => e).toSet(),
    ));
  }
}
