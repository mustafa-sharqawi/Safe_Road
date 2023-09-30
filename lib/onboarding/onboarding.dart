import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import '../main.dart';

class IntroOverboardPage extends StatefulWidget {
  static const routeName = '/IntroOverboardPage';

  @override
  _IntroOverboardPageState createState() => _IntroOverboardPageState();
}

class _IntroOverboardPageState extends State<IntroOverboardPage>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: OverBoard(
        pages: pages,
        showBullets: true,
        skipCallback: () {
          _globalKey.currentState?.showSnackBar(SnackBar(
            content: Text("Skip clicked"),
          ));
          setState(() {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyPage(),
                ));
          });
        },
        finishCallback: () {
          _globalKey.currentState?.showSnackBar(SnackBar(
            content: Text("Finish clicked"),
          ));
          setState(() {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyPage(),
                ));
          });
        },
      ),
    );
  }

  final pages = [
    PageModel(
        color: Color(0xFF9B90BC),
        title: "",
        imageAssetPath: 'images/1.jpg',
        body: 'Welcome to Safe Road application.\n\n',
        doAnimateImage: true),
    PageModel(
        color: const Color(0xFF9B90BC),
        imageAssetPath: 'images/2.jpg',
        title: 'Emergency',
        body: 'You can contact the service provider.',
        doAnimateImage: true),
    PageModel(
        color: const Color(0xFF9B90BC),
        imageAssetPath: 'images/4.jpg',
        title: 'Service provider',
        body: 'Contact the nearest service provider.',
        doAnimateImage: true),
    PageModel(
        color: const Color(0xFF9B90BC),
        imageAssetPath: 'images/5.jpg',
        title: 'Sell and Rent',
        body: 'You Can Buy and Rent Vehicles.',
        doAnimateImage: true),
  ];
}
