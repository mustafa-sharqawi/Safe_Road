import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:youtube/history_data.dart';
import 'package:youtube/global/globals.dart' as globals;

class history extends StatefulWidget {


  const history();

  @override
  _historyScreenState createState() => _historyScreenState();
}

class _historyScreenState extends State<history> {
  // late Future<List<Data>> futureData;
  ServiceDetailsModel _PromotionScreen;
  List<Data> _dataList = [];
  bool _isLoading = false;

  // final images = [
  //   'https://www.brilliancefuture.com/uploads/IntroductionPage/Avatar/603/SkinCare-01.jpg',
  //   'https://www.brilliancefuture.com/uploads/IntroductionPage/Avatar/603/SkinCare-01.jpg',
  //   'https://www.brilliancefuture.com/uploads/IntroductionPage/Avatar/603/SkinCare-01.jpg',
  //   'https://www.brilliancefuture.com/uploads/IntroductionPage/Avatar/603/SkinCare-01.jpg'
  // ];
  //  final data = [
  //    'Offer Name',
  //    'Offer Name',
  //    'Offer Name',
  //    'Offer Name',
  //  ];

  listItemsRequest() async {
    setState(() {
      _isLoading = true;
    });
    var url = Uri.parse('http://10.0.2.2:8000/safe_road/history.php?id=${globals.user_id}');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      log('Body : ${response.body}');
      var data = json.decode(response.body);
      _PromotionScreen = ServiceDetailsModel.fromJson(data);
      print(_dataList.length);
      _dataList = _PromotionScreen.data;
      // List jsonResponse = json.decode(response.body);
      // return jsonResponse.map((data) => new Data.fromJson(data)).toList();
    } else {
      //TODO Stop Loading
      log('Unexpected error occured!');
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    //TODO Start Loading
    listItemsRequest();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey,
          appBar: AppBar(
            backgroundColor: Colors.grey,
            centerTitle: true,
            title: Text(
              "Safe-Road",
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
          ),
          body: _isLoading
              ? Center(
            child: CircularProgressIndicator(
              // semanticsLabel: 'Linear progress indicator',
            ),
          )
              : ListView.builder(
              itemCount: _dataList.length,

              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      height: 200,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            // child: ClipRRect(
                            //   borderRadius: BorderRadius.circular(15),
                            //   child: Image.network(
                            //     'http://10.0.2.2:8000/safe_road/uplode/' +
                            //         _dataList[index].image,
                            //     fit: BoxFit.cover,
                            //   ),
                            // ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.7),
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                             'l',
                              maxLines: 3,
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'l',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 26),
                                ),
                                Text(
                                  "\$ : Price",
                                  maxLines: 3,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // onTap: () {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => PromotionList(
                  //             promoId: _promotionModel.data[index].id)),
                  //   );
                  // },
                );
              })),
    );
  }
}
