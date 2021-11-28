import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:short_stay/services/api.dart';
import 'package:short_stay/ui-screens/bottom_navigation_bar.dart';
import 'package:short_stay/ui-screens/forget_password_a.dart';
import 'package:short_stay/ui-screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  String mobile, password;
  bool status = false;

  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  login() {
    setState(() {
      status = true;
    });
    final form = _formKey.currentState;
    form.save();
    print(mobile);
    print(password);
    Future<bool> loginStatus = Api().loginUser(mobile, password);
    loginStatus.then((value) => {
          print(value),
          if (value)
            {
              print("here"),
              print(value),
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => bottomBar()))
            }
          else
            {
              setState(() {
                status = false;
              }),
              print("else"),
              Fluttertoast.showToast(
                  msg: "Email or password incorrect",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0)
            }
        });
  }

  screenData() {
    if (status) {
      return Padding(
        padding: const EdgeInsets.all(64.0),
        child: Center(
            child: SpinKitFadingCircle(
          color: Color(0xff1f1b51),
          size: 50.0,
          controller: AnimationController(
              vsync: this, duration: const Duration(milliseconds: 1200)),
        )),
      );
    } else {
      return Container(
        padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.phone,
                autofocus: false,
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please Enter Mobile Number';
                  }else
                    if(value.length < 11){
                      return 'Please enter a valid Mobile number';
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
                        borderSide: BorderSide(color: Color(0xff1f1b51)))),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                autofocus: false,
                controller: _passwordController,
                obscureText: true,
                onSaved: (String value) {
                  password = value;
                },
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Password cannot be empty';
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
                        borderSide: BorderSide(color: Color(0xff1f1b51)))),
              ),
              SizedBox(height: 5.0),
              Container(
                  alignment: Alignment(1.0, 0.0),
                  padding: EdgeInsets.only(top: 15.0, left: 20.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => fpa()),
                      );
                    },
                    child: Text(
                      'Forget Password ?',
                      style: TextStyle(
                          color: Color(0xff1f1b51),
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  )),
              SizedBox(height: 40.0),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff1f1b51),
                  ),
                  onPressed: () {
                    if ((_formKey.currentState.validate())) {
                      login();
                    } else {
                      Fluttertoast.showToast(
                          msg: "Fill Form Correctly",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  child: Text('Sign In')),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'New to short stay ?',
                    style: TextStyle(fontFamily: 'Montserrat'),
                  ),
                  SizedBox(width: 5.0),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Color(0xff1f1b51),
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                        child: Text(
                          'SignIn',
                          style: TextStyle(
                              fontSize: 40.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(130.0, 75.0, 0.0, 0.0),
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
                screenData(),
              ],
            ),
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
