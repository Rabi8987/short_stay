import 'package:flutter/material.dart';
import 'package:short_stay/services/api.dart';
import 'package:short_stay/ui-screens/bottom_navigation_bar.dart';


class UpdatePassword extends StatefulWidget {
  const UpdatePassword({Key key}) : super(key: key);

  @override
  _UpdatePasswordState createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  void backButton() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => bottomBar()),
    );
  }

  @override
  Widget build(BuildContext context) {
    String oldPassword, newPassword, confirmNewPassword;
    final _formKey = GlobalKey<FormState>();

    updatePassword() {
      print("here");
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
                }
            });

        // Navigator.pushReplacement(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => Setting()));
      } else {
        print("else");
        return AlertDialog(
            title: Text('Password Not updated'),
            content: Text("Given passwords does not match."),
            actions: [
              okButton,
            ]);
      }
    }

    return WillPopScope(
      onWillPop: () {
        backButton();
        return Future.value(false);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
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
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                      child: Text('change',
                          style: TextStyle(
                              fontSize: 50.0, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                      child: Text('Password',
                          style: TextStyle(
                              fontSize: 50.0, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(240.0, 150.0, 0.0, 0.0),
                      child: Text('.',
                          style: TextStyle(
                              fontSize: 80.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff1f1b51))),
                    )
                  ],
                ),
              ),
              Form(
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
                        InkWell(
                          onTap: () {
                            updatePassword();
                          },
                          child: Container(
                            height: 40.0,
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              shadowColor: Color(0xff323e78),
                              color: Color(0xff1f1b51),
                              //0xff323e78
                              elevation: 9.0,
                              child: Center(
                                child: Text(
                                  'Update Password',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
