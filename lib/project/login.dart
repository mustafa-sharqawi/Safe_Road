import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:youtube/file/forgotpassword.dart';
import '../select.dart';
import 'package:http/http.dart' as http;
import 'package:youtube/global/globals.dart' as globals;
import 'maps_service.dart';

class AuthThreePage extends StatefulWidget {
  const AuthThreePage({Key key}) : super(key: key);

  @override
  _AuthThreePageState createState() => _AuthThreePageState();
}

class _AuthThreePageState extends State<AuthThreePage> {
  bool formVisible;
  int _formsIndex;

  @override
  void initState() {
    super.initState();
    formVisible = false;
    _formsIndex = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0.0,
        leading: Icon(
          Icons.arrow_back_outlined,
          color: Colors.grey,
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.grey[600],
            child: Stack(
              children: [
                Image(
                  image: AssetImage('images/background.jpeg'),
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                Column(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: const <Widget>[
                          SizedBox(height: 10.0),
                        ],
                      ),
                    ),
                    Center(
                      child: Column(
                        children: <Widget>[
                          const SizedBox(width: 10.0),
                          Container(
                            width: 250.0,
                            child: RaisedButton.icon(
                              textColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              icon: Icon(Icons.person),
                              label: const Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w900),
                              ),
                              onPressed: () {
                                setState(() {
                                  formVisible = true;
                                  _formsIndex = 1;
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          Center(
                            child: Container(
                              width: 250.0,
                              child: RaisedButton.icon(
                                // borderSide:
                                //     const BorderSide(color: Colors.black),
                                color: Colors.red,
                                textColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                icon: Icon(Icons.person),
                                label: const Text(
                                  "Signup",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w900),
                                ),
                                onPressed: () {
                                  setState(() {
                                    formVisible = true;
                                    _formsIndex = 2;
                                  });
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Center(
                      child: Container(
                        width: 250,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 350.0),
                          child: RaisedButton.icon(
                            // borderSide: const BorderSide(color: Colors.black),
                            color: Colors.red,
                            textColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            icon: Icon(Icons.person),
                            label: const Text(
                              "Emergency",
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.w900),
                            ),
                            onPressed: () {
                              setState(() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MapsServices(),
                                    ));
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ],
            ),
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: (!formVisible)
                ? null
                : Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      color: Colors.black54,
                      alignment: Alignment.topCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RaisedButton.icon(
                                // borderSide:
                                //     const BorderSide(color: Colors.black),
                                color: Colors.red,
                                textColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                icon: Icon(Icons.person),
                                label: const Text("Login"),
                                onPressed: () {
                                  setState(() {
                                    formVisible = true;
                                    _formsIndex = 1;
                                  });
                                },
                              ),
                              const SizedBox(width: 10.0),
                              RaisedButton.icon(
                                // borderSide:
                                //     const BorderSide(color: Colors.black),
                                color: Colors.red,
                                textColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                icon: Icon(Icons.person),
                                label: const Text("Signup"),
                                onPressed: () {
                                  setState(() {
                                    formVisible = true;
                                    _formsIndex = 2;
                                  });
                                },
                              ),
                              const SizedBox(width: 10.0),
                              IconButton(
                                color: Colors.white,
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  setState(() {
                                    formVisible = false;
                                  });
                                },
                              )
                            ],
                          ),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child:
                                _formsIndex == 1 ? LoginForm() : SignupForm(),
                          )
                        ],
                      ),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  LoginForm({
    Key key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  void clear() {
    emailController.text = null;
    passwordController.text = null;
  }

  var formKey = GlobalKey<FormState>();
  bool isHiddenPassword = true;

  Future<void> Login() async {
    // Showing CircularProgressIndicator using State.
    setState(() {
      isHiddenPassword = true;
    });

    // Getting value from Controller

    String email = emailController.text;
    String password = passwordController.text;

    // API URL
    var phpurl = 'http://10.0.2.2:8000/safe_road/login.php';

    var res = await http.post(Uri.parse(phpurl), body: {
      "email": email,
      "Password": password,
    });
    var data = json.decode(res.body);
    var test = data['success'];
    if (test == 1) {
// obtain shared preferences
// set value
      globals.user_id = data['user_id'];
      print(globals.user_id);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SelectPage(),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Form(
        key: formKey,
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
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
            const SizedBox(height: 10.0),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: InkWell(
                      onTap: _togglePasswordView,
                      child: Icon(Icons.remove_red_eye))),
              keyboardType: TextInputType.visiblePassword,
              obscureText: isHiddenPassword,
              controller: passwordController,
              onFieldSubmitted: (value) {},
              validator: (value) {
                if (value.isEmpty || value.length < 6) {
                  return "Password must be more than 6 characters";
                }
                return null;
              },
            ),
            const SizedBox(height: 10.0),
            RaisedButton.icon(
                // borderSide: const BorderSide(color: Colors.black),
                color: Colors.red,
                textColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                icon: Icon(Icons.person),
                label: const Text("Login"),
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    Login();
                    clear();
                  } else {
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
                }),
            TextButton(
              child: Text(
                'Forgot password?',
                style: TextStyle(color: Colors.grey[900]),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => forgotPassowrd()));
              },
            ),
          ],
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}

class SignupForm extends StatefulWidget {
  SignupForm({
    Key key,
  }) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  var fullNameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var confirmPassword = TextEditingController();

  var phone = TextEditingController();

  Function press;

  bool password = false;

  bool isHiddenPassword1 = true;

  bool isHiddenPassword2 = true;

// void fun(){
//  Siqnup();
//
// }
  Future<void> Siqnup() async {
    // Showing CircularProgressIndicator using State.
    setState(() {
      password = true;
    });

    // Getting value from Controller
    String name = fullNameController.text;
    String email = emailController.text;
    String phoneNumber = phone.text;
    String Password_c = confirmPassword.text;

    // API URL
    var phpurl = 'http://10.0.2.2:8000/safe_road/signup.php';
    var res = await http.post(Uri.parse(phpurl), body: {
      "name": name,
      "email": email,
      "phone": phoneNumber,
      "Password_c": Password_c,
    });
    var data = json.decode(res.body);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AuthThreePage(),
        ));
  }

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SingleChildScrollView(
        child: Center(
          child: Form(
            key: formKey,
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(10.0),
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Full Name",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person)),
                  keyboardType: TextInputType.text,
                  controller: fullNameController,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (value.isEmpty || value.length < 10) {
                      return "Please Check from Full Name";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10.0),
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
                      return "Please Check from email address";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.lock,
                    ),
                    suffixIcon: InkWell(
                        onTap: _togglePassword1,
                        child: Icon(
                          Icons.remove_red_eye,
                        )),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: isHiddenPassword1,
                  controller: passwordController,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (value.isEmpty || value.length < 6) {
                      return "Password must be more than 6 characters";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Confirm password",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: InkWell(
                          onTap: _togglePassword2,
                          child: Icon(Icons.remove_red_eye))),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: isHiddenPassword2,
                  controller: confirmPassword,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (value.isEmpty ||
                        value.length < 6 ||
                        confirmPassword == passwordController) {
                      return "Verify the password";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                    decoration: InputDecoration(
                        hintText: "Phone Number",
                        labelText: "+962",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.phone)),
                    keyboardType: TextInputType.number,
                    controller: phone,
                    validator: (value) {
                      if (value.isEmpty ||
                          value.length < 9 ||
                          value.length != 10) {
                        return "Please Check from Phone Number";
                      }
                    }),
                const SizedBox(height: 10.0),
                RaisedButton.icon(
                  // borderSide: const BorderSide(color: Colors.black),
                  color: Colors.red,
                  textColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  icon: Icon(Icons.person),
                  label: const Text("Signup"),
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      Siqnup();
                      showDialog(
                          context: context,
                          builder: (context) {
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
                          });
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                'َWarning',
                                textAlign: TextAlign.center,
                              ),
                              content: Text(
                                'Please verify the information you entered',
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
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _togglePassword1() {
    setState(() {
      isHiddenPassword1 = !isHiddenPassword1;
    });
  }

  void _togglePassword2() {
    setState(() {
      isHiddenPassword2 = !isHiddenPassword2;
    });
  }
}
