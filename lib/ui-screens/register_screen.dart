import 'package:flutter/material.dart';

import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
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
                                      validator: (email) {
                                        if (isEmailValid(email))
                                          return null;
                                        else
                                          return 'Enter a valid email address';
                                      },
                                      decoration: InputDecoration(
                                          labelText: 'EMAIL',
                                          labelStyle: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black38),
                                          // hintText: 'EMAIL',
                                          // hintStyle: ,
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xff1f1b51)))),
                                    ),
                                    SizedBox(height: 10.0),
                                    TextFormField(
                                      maxLength: 6,
                                      controller: _passwordController,
                                      obscureText: true,
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return 'Password cannot be empty';
                                        } else if (value.length < 6) {
                                          return 'Password must be at least 6 characters long.';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          labelText: 'PASSWORD ',
                                          labelStyle: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black38),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xff1f1b51)))),
                                    ),
                                    SizedBox(height: 10.0),
                                    TextFormField(
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return 'FirstName cannot be empty';
                                        } else if (value.length < 3) {
                                          return 'FirstName must be at least 3 characters long.';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          labelText: 'FIRST NAME ',
                                          labelStyle: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black38),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xff1f1b51)))),
                                    ),
                                    SizedBox(height: 10.0),
                                    TextFormField(
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return 'LastName cannot be empty';
                                        } else if (value.length < 3) {
                                          return 'LastName must be at least 3 characters long.';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          labelText: 'LAST NAME ',
                                          labelStyle: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black38),
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
                                          if (_formKey.currentState
                                              .validate()) {
                                            debugPrint(
                                                'All validations passed!!!');
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        LoginScreen()));
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
