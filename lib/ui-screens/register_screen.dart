import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:short_stay/models/User.dart';
import 'package:short_stay/services/api.dart';
import 'package:short_stay/ui-screens/otp.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String name, username, mobile, email, address, password;

  // final _nameController = TextEditingController();
  // final _usernameController = TextEditingController();
  // final _mobileController = TextEditingController();
  // final _emailController = TextEditingController();
  // final _addressController = TextEditingController();
  final _passwordController = TextEditingController();

  Timer _timer;

  @override
  Widget build(BuildContext context) {
    Future<User> _userData;
    var doRegister = () async {
      final form = _formKey.currentState;
      form.save();
      var user = User.fromJson({
        'id': null,
        'name': name,
        'username': username,
        'mobile': mobile,
        'email': email,
        'address': address,
        'password': password
      });
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => otpScreen(user: user)));
    };
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                      child: Text(
                        'Signup',
                        style: TextStyle(
                            fontSize: 40.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(140.0, 85.0, 0.0, 0.0),
                      child: Text(
                        '.',
                        style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff1f1b51)),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 0,
                  color: Colors.transparent,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                            padding: EdgeInsets.only(
                                top: 35.0, left: 20.0, right: 20.0),
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  autofocus: false,
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return 'Please Enter Full Name';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    name = value;
                                  },
                                  decoration: InputDecoration(
                                      labelText: 'NAME ',
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff1f1b51)),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xff1f1b51)))),
                                ),
                                SizedBox(height: 10.0),
                                TextFormField(
                                  autofocus: false,
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return 'Please Enter User Name';
                                    }
                                    return null;
                                  },
                                  onSaved: (String value) {
                                    username = value;
                                  },
                                  decoration: InputDecoration(
                                      labelText: 'USER NAME ',
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff1f1b51)),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xff1f1b51)))),
                                ),
                                SizedBox(height: 10.0),
                                TextFormField(
                                  keyboardType: TextInputType.phone,
                                  autofocus: false,
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return 'Please Enter Mobile Number';
                                    }
                                    return null;
                                  },
                                  onSaved: (String value) {
                                    mobile = value;
                                  },
                                  decoration: InputDecoration(
                                      labelText: 'PHONE ',
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff1f1b51)),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xff1f1b51)))),
                                ),
                                SizedBox(height: 10.0),
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  autofocus: false,
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return 'Please a Enter Email';
                                    }
                                    if (!RegExp(
                                            "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                        .hasMatch(value)) {
                                      return 'Please a valid Email';
                                    }
                                    return null;
                                  },
                                  onSaved: (String value) {
                                    email = value;
                                  },
                                  decoration: InputDecoration(
                                      labelText: 'EMAIL',
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff1f1b51)),
                                      // hintText: 'EMAIL',
                                      // hintStyle: ,
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xff1f1b51)))),
                                ),
                                SizedBox(height: 10.0),
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  autofocus: false,
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return 'Please a Enter Address';
                                    }

                                    return null;
                                  },
                                  onSaved: (String value) {
                                    email = value;
                                  },
                                  decoration: InputDecoration(
                                      labelText: 'ADDRESS',
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff1f1b51)),
                                      // hintText: 'EMAIL',
                                      // hintStyle: ,
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xff1f1b51)))),
                                ),
                                SizedBox(height: 10.0),
                                TextFormField(
                                  keyboardType: TextInputType.visiblePassword,
                                  autofocus: false,
                                  maxLength: 4,
                                  controller: _passwordController,
                                  obscureText: true,
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return 'Password cannot be empty';
                                    } else if (value.length < 4) {
                                      return 'Password must be at least 4 characters long.';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      labelText: 'PASSWORD ',
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff1f1b51)),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xff1f1b51)))),
                                ),
                                SizedBox(height: 50.0),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xff1f1b51),
                                    ),
                                    onPressed: () {
                                      if ((_formKey.currentState.validate())) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    "Registering New User")));

                                        _timer = new Timer(
                                            const Duration(milliseconds: 400),
                                            () {
                                          setState(() {
                                            doRegister();
                                          });
                                        });
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text("Fill Form!!")));
                                      }
                                    },
                                    child: Text('Register'))
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}

bool isEmailValid(String email) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  return regex.hasMatch(email);
}
