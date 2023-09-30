import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'about us',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[500],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "images/Logo.jpg",
            fit: BoxFit.cover,
          ),
          Text(
              " the purpose of this project is to develop a new application  service concept for maintenance, washing, sale of spare  parts and availability of car accessories as well as  emergency service to connect with the nearest service  provider of Within a single application, all these features are  available on Android and IOS devices. We have looked at  similar ideas for our app. And we found out that it doesn't  support all these features in one app. Or it does not even  provide the services that we want to implement in the application. "),
        ],
      ),
    );
  }
}
