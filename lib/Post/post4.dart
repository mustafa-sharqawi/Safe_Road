import 'package:flutter/material.dart';
import 'package:youtube/Post/postmain.dart';
import 'model.dart';
import 'post.dart';

class Post4 extends StatefulWidget {
  final List<String> region;
  final Color color;

  Post4({@required this.color, @required this.region});

  @override
  State<Post4> createState() => _Post4State();
}

class _Post4State extends State<Post4> {
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
          'Select Region',
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
            ...widget.region
                .map(
                  (item) => ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: InkWell(
                      onTap: () {
                        City.region = item;

                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (ctx) => MyPostHome()));
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
