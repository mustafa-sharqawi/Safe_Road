import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:youtube/select.dart';
import 'image_picker.dart';
import 'model.dart';
import 'post.dart';
import 'post3.dart';
import 'package:youtube/global/globals.dart' as globals;
import 'package:http/http.dart' as http;

class MyPostHome extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyPostHome> {
  double lat;

  double long;

  void getLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    print(lastPosition);
    setState(() {
      locationMessage = "$position.latitude , $position.longitude";
      lat = position.latitude;
      long = position.longitude;
    });
  }

  String category = SellOrAdvertise.category;
  String subcat = SellOrAdvertise.subCategory;
  String condtion = SellOrAdvertise.condition;
  var city = City.city;
  var region = City.region;
  static Future<File> file;
  String status = '';
  static String base64Image;
 static File tmpFile;
void clear(){
  file=null;
  base64Image=null;
  tmpFile=null;
  SellOrAdvertise.category = null;
  SellOrAdvertise.subCategory = null;
  SellOrAdvertise.condition = null;
  City.city = null;
  City.region = null;
}
  chooseImage() {
    setState(() {
      file = ImagePicker.pickImage(source: ImageSource.gallery);
    });
  }

  var locationMessage = "";
  int id = globals.user_id;

  Future<void> Post5() async {
    try {
      var formdata = formKey.currentState;
      if (formdata.validate())
        {

        }
      getLocation();
      String fileName = tmpFile.path.split('/').last;
      var phpurl = 'http://10.0.2.2:8000/safe_road/services_add.php';
      var res = await http.post(Uri.parse(phpurl), body: {
      "status": "0",
        "image": base64Image,
        "namei": fileName,
        "category": category,
        "subcategory": subcat,
        "commerical_register": text.commericalRegister.text,
        "title": text.titleController.text,
        "description": text.descriptionController.text,
        "price": text.priceController.text,
        "work_hours": text.workHoursController.text,
        "city": city,
        "region": region,
        "user_id": "$id",
        "name": text.nameController.text,
        "phone": text.phoneController.text,
        "lat": "$lat",
        "long": "$long",
      });

      var data = json.decode(res.body);
    } catch (e) {}
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'َDone..',
              textAlign: TextAlign.center,
            ),
            content: Text(
              'The process has been completed successfully',
              style: TextStyle(fontSize: 15.5),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: Text('OK'),
              ),
            ],
            //child: const Text('Show Dialog'),
          );
        });
  }

  var formKey = GlobalKey<FormState>();

  // _showOption(BuildContext context) {
  //   return showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //             title: const Text(
  //               'Make a choice',
  //             ),
  //             content: SingleChildScrollView(
  //               child: Column(
  //                 children: [
  //                   ListTile(
  //                     leading: const Icon(Icons.image),
  //                     title: const Text(
  //                       'Gallery',
  //                     ),
  //                   ),
  //                   ListTile(
  //                     leading: const Icon(Icons.camera),
  //                     title: const Text(
  //                       'Camera',
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
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
                          onPressed: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SelectPage())),
                            SellOrAdvertise.category = null,
                            SellOrAdvertise.subCategory = null,
                            SellOrAdvertise.condition = null,
                            City.city = null,
                            City.region = null,
                          },
                          child: Text('Yes'),
                        ),
                      ],
                      //child: const Text('Show Dialog'),
                    );
                  });
            }),
        title: const Text(
          'Add Post',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, bottom: 10, right: 10, top: 10),
              child: Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    color: Colors.grey[400],
                    child: Row(
                      children: [
                        Text(
                          "Choice Photo",
                          style: TextStyle(fontSize: 22.0),
                        ),
                        IconButton(
                          onPressed: () {
                            chooseImage();
                          },
                          icon: Icon(
                            Icons.edit,
                            size: 30.0,
                            color: Colors.black54,
                          ),
                        ),
                        FutureBuilder<File>(
                          future: file,
                          builder: (BuildContext context,
                              AsyncSnapshot<File> snapshot) {
                            if (snapshot.connectionState ==
                                    ConnectionState.done &&
                                null != snapshot.data) {
                              tmpFile = snapshot.data;
                              base64Image =
                                  base64Encode(snapshot.data.readAsBytesSync());
                              return Container(
                                margin: EdgeInsets.all(15),
                                child: Material(
                                  elevation: 0.0,
                                  child: Image.file(
                                    snapshot.data,
                                    width: 100.0,
                                    height: 100.0,
                                  ),
                                ),
                              );
                            } else if (null != snapshot.error) {
                              return const Text(
                                'Error!',
                                textAlign: TextAlign.center,
                              );
                            } else {
                              return Container(
                                margin: EdgeInsets.all(15),
                                child: Material(
                                  elevation: 3.0,
                                  child: Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 10.0, right: 10.0),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                'Ads with photo sell up to 5x Faster.',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: SizedBox(
                  height: 50.0,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Post()));
                      });
                      SellOrAdvertise.category = null;
                      SellOrAdvertise.subCategory = null;
                      SellOrAdvertise.condition = null;
                    },
                    label: const Padding(
                      padding: const EdgeInsets.only(right: 45.0),
                      child: const Text(
                        '?What do you want to sell or advertise',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 15.0,
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.grey[300]),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ))),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            if (SellOrAdvertise.category != null) ...{
              SizedBox(
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListTile(
                    title: const Text('category'),
                    tileColor: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    subtitle: Text('${SellOrAdvertise.category}'),
                  ),
                ),
              ),
            },
            const SizedBox(
              height: 7.0,
            ),
            if (SellOrAdvertise.subCategory != null) ...{
              SizedBox(
                height: 60.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListTile(
                    title: const Text('subcategory'),
                    tileColor: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    subtitle: Text('${SellOrAdvertise.subCategory}'),
                  ),
                ),
              ),
            },
            const SizedBox(
              height: 10.0,
            ),
            if (SellOrAdvertise.condition != null) ...{
              SizedBox(
                height: 60.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListTile(
                    title: const Text('condition'),
                    tileColor: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    subtitle: Text('${SellOrAdvertise.condition}'),
                  ),
                ),
              ),
            },
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                maxLength: 10,
                controller: text.phoneController,
                keyboardType: TextInputType.phone,
                style: const TextStyle(
                  fontSize: 17.0,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Phone Number Must Not Be Empty';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  counter: Offstage(),
                  hintText: 'Phone',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: text.commericalRegister,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontSize: 17.0,
                ),
                // validator: (value) {
                //   if (value.isEmpty) {
                //     return 'Commercial Register Must Not Be Empty';
                //   }
                //   return null;
                // },
                decoration: const InputDecoration(
                  hintText: 'Commercial Register',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: text.titleController,
                style: const TextStyle(
                  fontSize: 17.0,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Title Must Not Be Empty';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: 'Ad Title (eg: Toyota camry 2018 for Sale)',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: text.descriptionController,
                style: const TextStyle(
                  fontSize: 17.0,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                minLines: 3,
                onFieldSubmitted: (value) {
                  print(value);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Description Must Not Be Empty';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: 'Ad Description (Add more details)',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: text.priceController,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontSize: 17.0,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Price Must Not Be Empty';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  filled: true,
                  hintText: 'Price',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: text.workHoursController,
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                style: const TextStyle(
                  fontSize: 17.0,
                ),
                validator: (value) {
                  if (value.isEmpty ) {
                    return 'Work Hours Must Not Be Empty';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  filled: true,
                  hintText: 'Work Hours',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: SizedBox(
                  height: 50.0,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Post3()));
                      });
                    },
                    label: const Padding(
                      padding: const EdgeInsets.only(right: 260.0),
                      child: const Text(
                        'City',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 15.0,
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.grey[300]),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ))),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            if (City.city != null) ...{
              SizedBox(
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListTile(
                    title: const Text('city'),
                    tileColor: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    subtitle: Text('${City.city}'),
                  ),
                ),
              ),
            },
            const SizedBox(
              height: 10.0,
            ),
            if (City.region != null) ...{
              SizedBox(
                height: 60.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListTile(
                    title: const Text('region'),
                    tileColor: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    subtitle: Text('${City.region}'), //
                  ),
                ),
              ),
            },
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 40,
                child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        return AlertDialog(
                          title: Text(
                            'َDone..',
                            textAlign: TextAlign.center,
                          ),
                          content: Text(
                            'The registration process has been completed successfully',
                            style: TextStyle(fontSize: 15.5),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: Text('OK'),
                            ),
                          ],
                          //child: const Text('Show Dialog'),
                        );
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueGrey),
                        //fixedSize: MaterialStateProperty.all(const Size.fromWidth(350)),

                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ))),
                    child: TextButton(
                      onPressed: () {
                        Post5();
                        text.clear();
                        clear();
                      },
                      child: Text(
                        'Save and Insert the Ad',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
      //floatingActionButton: buildColumn(context),
    );
  }

  // Column buildColumn(BuildContext context) {
  //   return Column(
  //     children: [
  //       SizedBox(
  //         height: 100.0,
  //         width: 100.0,
  //         child: ElevatedButton(
  //           onPressed: () => _showOption(context),
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: const [
  //               Icon(
  //                 Icons.add_photo_alternate,
  //                 size: 40.0,
  //               ),
  //               Text(
  //                 'Add Photo',
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
