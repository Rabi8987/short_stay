import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:short_stay/services/api.dart';

import 'login_screen.dart';


class fpc extends StatefulWidget {
  final String mobile;

  const fpc({Key key, @required this.mobile}) : super(key: key);

  @override
  _fpcState createState() => _fpcState();
}

class _fpcState extends State<fpc> with TickerProviderStateMixin {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String  newPassword, confirmNewPassword;

    updatePassword() {
      setState(() {
        status = true;
      });

      Widget okButton = TextButton(
        child: Text("Ok"),
        onPressed: () {},
      );
      final form = _formKey.currentState;
      form.save();
      if (newPassword == confirmNewPassword) {
        Future<bool> res = Api().forgetPassword(widget.mobile,newPassword);
        res.then((value) => {
          if (value)
            {

      Navigator.push(
      context,
      MaterialPageRoute(
      builder: (context) => LoginScreen()))
            }else{
            setState(() {
              status = false;
            }),
          }
        });
      } else {
        print("else");
        setState(() {
          status = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Password not match")));

      }
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
        return Form(
          key: _formKey,
          child: Container(
              padding:
              EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    onSaved: (value) {
                      newPassword = value;
                    },
                    decoration: InputDecoration(
                        labelText: 'New Password',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Color(0xff1f1b51)))),
                    obscureText: true,
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    onSaved: (value) {
                      confirmNewPassword = value;
                    },
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please re-enter password';
                      }

                      else if (confirmNewPassword != newPassword) {
                        return "Password does not match";
                      }
                      else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        labelText: 'Confirm New Password',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Color(0xff1f1b51)))),
                    obscureText: true,
                  ),
                  SizedBox(height: 40.0),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff1f1b51),
                      ),
                      onPressed: () {
                        if ((_formKey.currentState.validate())) {
                          updatePassword();
                        }
                      },
                      child: Text('Reset Password'))
                ],
              )),
        );
      }
    }


    return WillPopScope(
      onWillPop: () {
        // backButton();
        return Future.value(false);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 80.0, 0.0, 0.0),
                    child: Text('Forget',
                        style: TextStyle(
                            fontSize: 50.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 130.0, 0.0, 0.0),
                    child: Text('Password',
                        style: TextStyle(
                            fontSize: 50.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(240.0, 105, 0.0, 0.0),
                    child: Text('.',
                        style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff1f1b51))),
                  )
                ],
              ),
              screenData(),
            ],
          ),
        ),
      ),
    );
  }
}
