import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:youtube/global/globals.dart' as globals;
import 'package:youtube/global/globals.dart';
import 'package:youtube/services_post/Show_service.dart';
import '../settingspage.dart';
import '../settingsui.dart';
import 'about_us.dart';
import 'package:http/http.dart' as http;

class MyDrawer extends StatefulWidget {
  MyDrawer({Key key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  void initState() {
    super.initState();
    updateUser();
  }

  void updateUser() {
    UserDetails();
  }

  Future<void> UserDetails() async {
    // API URL
    var phpurl = 'http://10.0.2.2:8000/safe_road/user_details.php';
    var res = await http.post(Uri.parse(phpurl), body: {
      "user_id": '$user_id',
    });
    var data = json.decode(res.body)['data'];
    globals.username = data['name'];
    globals.email = data['email'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(
                  '$username',
                  style: TextStyle(fontSize: 24.0),
                ),
                accountEmail: Text('$email'),
                currentAccountPicture: GestureDetector(
                  child: new CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                ),
                decoration: BoxDecoration(color: Colors.blueGrey),
              ),
              Container(
                padding: EdgeInsets.only(right: 20.0, left: 10.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SettingsUI();
                        },
                      ),
                    );
                  },
                  child: ListTile(
                    title: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SettingsUI(),
                              ));
                        },
                        child: Text(
                          'Profile',
                          style: TextStyle(fontSize: 22.0, color: Colors.black),
                        )),
                    leading: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SettingsUI(),
                              ));
                        },
                        icon: Icon(
                          Icons.home,
                          color: Colors.blueGrey,
                        )),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 20.0,
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.grey[500],
              ),
              Container(
                padding: EdgeInsets.only(right: 10.0, left: 10.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SettingsPage();
                        },
                      ),
                    );
                  },
                  child: ListTile(
                    title: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SettingsPage(),
                              ));
                        },
                        child: Text(
                          'Settings',
                          style: TextStyle(fontSize: 22.0, color: Colors.black),
                        )),
                    leading: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SettingsPage(),
                              ));
                        },
                        icon: Icon(
                          Icons.settings,
                          color: Colors.blueGrey,
                        )),
                    trailing: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SettingsPage(),
                              ));
                        },
                        icon: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SettingsPage(),
                                  ));
                            },
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                              size: 20.0,
                            ))),
                  ),
                ),
              ),
              Divider(
                color: Colors.grey[500],
              ),
              Container(
                padding: EdgeInsets.only(right: 10.0, left: 10.0),
                child: InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PromotionScreen('h',''),
                              ));
                        },
                        child: Text(
                          'History',
                          style: TextStyle(fontSize: 22.0, color: Colors.black),
                        )),
                    leading: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PromotionScreen('h',""),
                              ));
                        },
                        icon: Icon(
                          Icons.history,
                          color: Colors.blueGrey,
                        )),
                    trailing: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PromotionScreen('h',''),
                              ));
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 20.0,
                        )),
                  ),
                ),
              ),
              Divider(
                color: Colors.grey[500],
              ),
              Container(
                padding: EdgeInsets.only(right: 10.0, left: 10.0),
                child: InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AboutUs(),
                              ));
                        },
                        child: Text(
                          'About us',
                          style: TextStyle(fontSize: 22.0, color: Colors.black),
                        )),
                    leading: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AboutUs(),
                              ));
                        },
                        icon: Icon(Icons.report)),
                    trailing: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AboutUs(),
                              ));
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 20.0,
                        )),
                  ),
                ),
              ),
              Divider(
                color: Colors.grey[500],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
