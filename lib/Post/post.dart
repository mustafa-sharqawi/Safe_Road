import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube/Post/postmain.dart';
import 'model.dart';
import 'post1.dart';

class Post extends StatefulWidget {
  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  final List<Map<String, dynamic>> _items = [
    {
      'title': 'Services',
      'color': Colors.blueAccent[100],
      'subCategories': [
        "Wheel Service",
        "Engine Service",
        "Oil Service",
        "Gas Service",
        "Wash Service",
        "Brake Service",
        "Towing Car"
      ]
    },
    {
      'title': 'Sell and Rent',
      'color': Colors.blueGrey,
      'subCategories': [
        "Sell",
        "Rent",
      ]
    },
    {
      'title': 'Accessories',
      'color': Colors.grey,
      'subCategories': [
        "Used",
        "New",
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyPostHome()));
              });
            }),
        title: const Text(
          'Select',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.black,
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Exit Add Post'),
                        content: Text(
                            'Are you sure you want to cancel adding a post?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyPostHome())),
                            child: Text('Yes'),
                          ),
                        ],
                        //child: const Text('Show Dialog'),
                      );
                    });
              }),
        ],
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 1,
          padding: EdgeInsets.symmetric(horizontal: 50),
          mainAxisSpacing: 50,
          //crossAxisSpacing: 100,
          childAspectRatio: 3 / 2,
          children: [
            ..._items
                .map(
                  (item) => ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: InkWell(
                      onTap: () {
                        if (item['subCategories'] != null) {
                          SellOrAdvertise.category = item['title'];
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => Post1(
                                    subCategories: item['subCategories'],
                                    color: item['color'],
                                  )));
                        }
                      },
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                                colors: [
                                  item['color'],
                                  item['color'].withOpacity(0.3),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight)),
                        child: Center(
                          child: Text(
                            item['title'],
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
