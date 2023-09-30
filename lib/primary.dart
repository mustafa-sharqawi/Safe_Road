import 'package:flutter/material.dart';
import 'package:youtube/project/splashscreen.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({Key key}) : super(key: key);

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Safe Road',
      debugShowCheckedModeBanner: false,
      home: MySplashScreen(),
    );
  }
}
