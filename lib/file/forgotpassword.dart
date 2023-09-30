import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:youtube/project/login.dart';
import 'package:http/http.dart' as http;

class forgotPassowrd extends StatefulWidget {
  forgotPassowrd({Key key}) : super(key: key);

  @override
  State<forgotPassowrd> createState() => _forgotPassowrdState();
}

class _forgotPassowrdState extends State<forgotPassowrd> {
  var emailController = TextEditingController();

  Future<void> forgotPassowrd() async {
    // Getting value from Controller
    String email = emailController.text;

    // API URL
    var phpurl = 'http://10.0.2.2:8000/safe_road/mailer/phpmailer/email.php';
    var res = await http.post(Uri.parse(phpurl), body: {
      "email": email,
    });
    var data = json.decode(res.body);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AuthThreePage(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Safe Road',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[600],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10.0,
          ),
          Text('Enter your email address'),
          TextFormField(
            decoration: InputDecoration(
                labelText: "Enter Email",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email)),
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            onFieldSubmitted: (value) {},
            validator: (value) {
              if (value.isEmpty ||
                  value.indexOf('.') == -1 ||
                  value.indexOf('@') == -1) {
                return "email address must not be empty";
              }
              return null;
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 100,
                  color: Colors.grey,
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AuthThreePage()));
                      },
                      child: Text('Cancel',
                          style: TextStyle(color: Colors.grey[800])))),
              SizedBox(
                width: 10.0,
              ),
              Container(
                  width: 100,
                  color: Colors.grey,
                  child: TextButton(
                      onPressed: () {
                        forgotPassowrd();
                      },
                      child: Text('Enter',
                          style: TextStyle(color: Colors.grey[800])))),
            ],
          )
        ],
      ),
    );
  }
}
