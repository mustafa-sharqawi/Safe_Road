import 'package:flutter/material.dart';
import 'package:youtube/Post/postmain.dart';
import 'model.dart';
import 'post.dart';
import 'post2.dart';

class Post1 extends StatefulWidget {
  final List<String> subCategories;
  final Color color;

  Post1(
      {@required this.subCategories,
      @required this.color,
      @required this.region});

  final List<String> region;

  @override
  State<Post1> createState() => _Post1State();
}

class _Post1State extends State<Post1> {
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
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Post()));
              });
            }),
        title: Text(
          SellOrAdvertise.category == 'Services'
              ? 'Select Service'
              : 'Select Option',
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
                                    builder: (context) => Post())),
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
            ...widget.subCategories
                .map(
                  (item) => ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: InkWell(
                      onTap: () {
                        SellOrAdvertise.subCategory = item;
                        if (item == 'Sell' || item == 'Rent') {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => Post2(color: widget.color)));
                        } else
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => MyPostHome()));
                      },
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                                colors: [
                                  widget.color,
                                  widget.color.withOpacity(0.3),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight)),
                        child: Center(
                          child: Text(
                            item,
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
