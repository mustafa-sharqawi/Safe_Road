import 'package:flutter/material.dart';
import 'about_us.dart';

class DrawerGuest extends StatelessWidget {
  const DrawerGuest({Key key}) : super(key: key);

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
                  'Guest',
                  style: TextStyle(fontSize: 24.0),
                ),
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
                accountEmail: null,
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
