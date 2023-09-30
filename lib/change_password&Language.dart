import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube/global/globals.dart';
import 'package:http/http.dart' as http;

class changePassword extends StatefulWidget {
  changePassword({Key key}) : super(key: key);

  @override
  State<changePassword> createState() => _changePasswordState();
}

class _changePasswordState extends State<changePassword> {
  bool password = true;

  bool password2 = true;

  bool password3 = true;
  var currentPassword = TextEditingController();
  var confirmPassword = TextEditingController();
  var passwordController = TextEditingController();
  String pass = "";
  GlobalKey<FormState> formState = new GlobalKey<FormState>();
bool x=false;
  void initState() {
    super.initState();
    updateUser();
  }

  void updateUser() {
    UserDetails();
  }

  Future<void> UserDetails() async {
    // API URL
    var phpurl = 'http://10.0.2.2:8000/safe_road/user_details.php';
    var res = await http.post(Uri.parse(phpurl), body: {
      "user_id": '$user_id',
    });
    var data = json.decode(res.body)['data'];
    pass = data['password'];
  }

  Future<void> change_pass() async {
    var formdata = formState.currentState;
    if (formdata.validate())
    {
      x=true;
      if(x==true){
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  'َDone',
                  textAlign: TextAlign.center,
                ),
                content: Text(
                  'Password has changed',
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
        //  AlertDialog(
        //   title: Text(
        //     'َWarning',
        //     textAlign: TextAlign.center,
        //   ),
        //   content: Text(
        //     'Please verify your email and password',
        //     style: TextStyle(fontSize: 15.5),
        //   ),
        //   actions: [
        //     TextButton(
        //       onPressed: () => Navigator.pop(context, 'OK'),
        //       child: Text('OK'),
        //     ),
        //   ],
        //   //child: const Text('Show Dialog'),
        // );
      }
      setState(() {
        password3 = true;
      });
    }
    else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                'َWarning',
                textAlign: TextAlign.center,
              ),
              content: Text(
                'Please verify your email and password',
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

      String passs = confirmPassword.text;
      // API URL

      var phpurl = 'http://10.0.2.2:8000/safe_road/change_pass.php';
      var res = await http
          .post(
          Uri.parse(phpurl), body: {"user_id": '$user_id', "pass": passs});
      var data = json.decode(res.body);

    }

    void _passwordView() {
      setState(() {
        password = !password;
      });
    }

    void _passwordView2() {
      setState(() {
        password2 = !password2;
      });
    }

    void _passwordView3() {
      setState(() {
        password3 = !password3;
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_rounded)),
        backgroundColor: Colors.grey,
      ),
      body: Form(
        key: formState,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Change Password',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Current Password",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: InkWell(
                          onTap: _passwordView,
                          child: Icon(Icons.remove_red_eye))),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: password,
                  controller: currentPassword,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (value.isEmpty || value.length < 6) {
                      return "Verify the password";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "New Password",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.lock,
                    ),
                    suffixIcon: InkWell(
                        onTap: _passwordView2,
                        child: Icon(
                          Icons.remove_red_eye,
                        )),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: password2,
                  controller: passwordController,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (value.isEmpty || value.length < 6 || passwordController==confirmPassword) {
                      return "Password must be more than 6 characters";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Confirm Password",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: InkWell(
                          onTap: _passwordView3,
                          child: Icon(Icons.remove_red_eye))),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: password3,
                  controller: confirmPassword,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (value.isEmpty ||
                        value.length < 6 ||
                         confirmPassword==passwordController) {
                      return "Verify the password";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 14.0),
                Container(
                    width: 100,
                    color: Colors.grey,
                    child: TextButton(
                        onPressed: change_pass,
                        child: Text('Enter',
                            style: TextStyle(color: Colors.grey[800])))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Language extends StatelessWidget {
  const Language({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_rounded)),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Change Language',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
            ),
            Divider(
              height: 20,
              thickness: 3,
            ),
            SizedBox(
              height: 10.0,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'English',
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                )),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'عربي',
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                )),
            SizedBox(
              height: 15.0,
            ),
            Container(
                width: 100,
                color: Colors.grey[700],
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Enter',
                      style: TextStyle(color: Colors.white),
                    ))),
          ],
        ),
      ),
    );
  }
}
