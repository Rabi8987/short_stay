import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:short_stay/services/api.dart';
import 'package:short_stay/ui-screens/bottom_navigation_bar.dart';

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({Key key}) : super(key: key);

  @override
  _UpdatePasswordState createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> with TickerProviderStateMixin {
  bool status = false;
  int userId;
  String name, email, mobile, username;
  bool session;
  void backButton() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => bottomBar()),
    );
  }

  @override
  Widget build(BuildContext context) {
    String oldPassword, newPassword, confirmNewPassword;

    final _formKey = GlobalKey<FormState>();
    void getSessionDetails() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      userId = prefs.getInt("userId");
      name = prefs.getString("full_name");
      email = prefs.getString("email");
      mobile = prefs.getString("mobile");
      username = prefs.getString("username");
      session = prefs.getBool("Session");
      print("zain setting");
      print(userId);
      print(name);
      print(email);
      print(mobile);
      print(username);
      print("session");
      print(session);
      setState(() {});
    }

    @override
    void initState() {
      // TODO: implement initState
      getSessionDetails();

      super.initState();
      // WidgetsBinding.instance.addPostFrameCallback((_) => screenData());
    }
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
        Future<bool> res = Api().updatePassword(oldPassword, newPassword);
        res.then((value) => {
              if (value)
                {
                  AlertDialog(
                      title: Text('Password updated'),
                      content: Text("Your password is updated."),
                      actions: [
                        okButton,
                      ])
                }else{
                setState(() {
                  status = false;
                }),
              }
            });

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => bottomBar()));
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
                      oldPassword = value;
                    },
                    decoration: InputDecoration(
                        labelText: 'Old Password',
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
                      child: Text('Update Account'))
                ],
              )),
        );
      }
    }

    return WillPopScope(
      onWillPop: () {
        backButton();
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
                    child: Text('Change',
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
