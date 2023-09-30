import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:youtube/global/globals.dart';
import 'select.dart';
import 'settingspage.dart';
import 'package:http/http.dart' as http;

class SettingsUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Setting UI",
      home: EditProfilePage(),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  var passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool showPassword = false;
  bool isHiddenPassword = true;
  String username = "";
  String email = "";
  String phone = "";
  String pass = "";
  var formKey = GlobalKey<FormState>();

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  void initState() {
    super.initState();
    updateUser();
  }

  void updateUser() {
    UserDetails();
  }

  Future<void> UserDetails() async {
    // Showing CircularProgressIndicator using State.
    setState(() {
      isHiddenPassword = true;
    });

    var phpurl = 'http://10.0.2.2:8000/safe_road/user_details.php';
    var res = await http.post(Uri.parse(phpurl), body: {
      "user_id": '$user_id',
    });
    var data = json.decode(res.body)['data'];
    username = data['name'];
    email = data['email'];
    phone = data['phone'];
    pass = data['password'];
    setState(() {
      emailController.text = "${email}";
      phoneController.text = "${phone}";
      fullNameController.text = "${username}";
    });
  }

  Future<void> SendData() async {
    // Showing CircularProgressIndicator using State.
    setState(() {
      isHiddenPassword = true;
    });

    // Getting value from Controller
    String name = fullNameController.text;
    String email = emailController.text;
    String phone = phoneController.text;
    String passs = passwordController.text;
    // API URL
      var phpurl = 'http://10.0.2.2:8000/safe_road/update_user.php';
      var res = await http.post(Uri.parse(phpurl), body: {
        "user_id": '$user_id',
        "name": name,
        "email": email,
        "phone": phone,
        "pass": passs
      });
      var data = json.decode(res.body);

      print(data);
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SelectPage(),
                ));
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.grey,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SettingsPage()));
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Edit Profile",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 35,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Full Name",
                ),
                controller: fullNameController,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Email",
                ),
                controller: emailController,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "phone",
                ),
                controller: phoneController,
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {},
                    child: Text("CANCEL",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  RaisedButton(
                      onPressed: () {},
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: TextButton(
                        onPressed: () {
                            SendData();
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      'َDone..',
                                      textAlign: TextAlign.center,
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
                        },
                        child: Text(
                          "SAVE",
                          style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 2.2,
                              color: Colors.black),
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}
