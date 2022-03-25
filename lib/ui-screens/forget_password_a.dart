import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:short_stay/ui-screens/forget_password_b.dart';

class fpa extends StatefulWidget {
  const fpa({Key key}) : super(key: key);

  @override
  _fpaState createState() => _fpaState();
}

class _fpaState extends State<fpa> with TickerProviderStateMixin {
  String mobile, password;
  bool status = false;

  final _formKey = GlobalKey<FormState>();
  final _mobileController = TextEditingController();

  final _passwordController = TextEditingController();

  void dispose() {
    _passwordController.dispose();
    super.dispose();
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
                controller: _mobileController,
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please Enter Mobile Number';
                  }
                  return null;
                },
                onSaved: (String value) {
                  _mobileController.text = value;
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
              SizedBox(height: 25.0),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff1f1b51),
                  ),
                  onPressed: () {
                    if ((_formKey.currentState.validate())) {
                      print(_mobileController.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => fpb(mobile: _mobileController.text)),
                      );
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
                  child: Text('Confirm')),
              SizedBox(height: 15.0),
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
                          'Enter Number',
                          style: TextStyle(
                              fontSize: 40.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(260.0, 75.0, 0.0, 0.0),
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
