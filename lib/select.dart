import 'package:flutter/material.dart';
import 'Post/postmain.dart';
import 'drawer/drawer.dart';
import 'project/maps_service.dart';
import 'services_post/main_service.dart';
import 'services_post/Show_service.dart';
import 'settingspage.dart';

class SelectPage extends StatefulWidget {
  @override
  _SelectPageState createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  int currentIndex = 0;
  GlobalKey<ScaffoldState> _keyDrawer = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _keyDrawer,
      drawer: MyDrawer(),
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            _keyDrawer.currentState.openDrawer();
          },
          child: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.grey[500],
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.grey[500],
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 80.0,
                  ),
                  Text("Choose your option to continue.,",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center),
                  Image.asset(
                    "assets/carservice.gif",
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PromotionScreen("Sell", "")));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blueGrey[700],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 100,
                              width: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.monetization_on,
                                    size: 45,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Sell&Rent',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainService()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blueGrey[700],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 100,
                              width: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.build,
                                    size: 45,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Services',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PromotionScreen("Accessories", "")));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blueGrey[700],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 100,
                              width: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.shopping_cart_rounded,
                                    size: 45,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Accessories',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 20,
        selectedFontSize: 20,
        selectedItemColor: Colors.indigo[500],
        backgroundColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(Icons.add_alert_sharp),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MapsServices()));
                },
              ),
              label:
                'Emergency',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(Icons.add_box),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyPostHome()));
                },
              ),
              label: 'Post',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(Icons.add_box),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingsPage()));
                },
              ),
              label: 'Settings',
              backgroundColor: Colors.white)
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
