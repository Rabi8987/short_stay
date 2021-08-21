import 'package:flutter/material.dart';
import 'package:short_stay/ui-screens/setting_screen.dart';

import 'favourite_screen.dart';
import 'hotel_list_screen.dart';

class UpdateAccount extends StatefulWidget {
  const UpdateAccount({Key key}) : super(key: key);

  @override
  _UpdateAccountState createState() => _UpdateAccountState();
}

class _UpdateAccountState extends State<UpdateAccount> {
  final _formKey = GlobalKey<FormState>();

  void backButton() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Setting()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        backButton();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              backButton();
            },
          ),
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
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              child: Text('Update',
                                  style: TextStyle(
                                      fontSize: 40.0,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Text('Account',
                                    style: TextStyle(
                                        fontSize: 40.0,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Container(
                              child: Text('.',
                                  style: TextStyle(
                                      fontSize: 50.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff1f1b51))),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
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
                                            color: Color(0xff1f1b51)),
                                        // hintText: 'EMAIL',
                                        // hintStyle: ,
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xff1f1b51)))),
                                  ),
                                  SizedBox(height: 10.0),
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
                                            color: Color(0xff1f1b51)),
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
                                            color: Color(0xff1f1b51)),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xff1f1b51)))),
                                  ),
                                  SizedBox(height: 10.0),
                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    validator: (String value) {
                                      if (value.isEmpty) {
                                        return 'Number cannot be empty';
                                      } else if (value.length < 3) {
                                        return 'Number must be 11 characters long.';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        labelText: 'PHONE NUMBER ',
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
                                        if (_formKey.currentState.validate()) {
                                          debugPrint(
                                              'All validations passed!!!');
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Setting()));
                                        }
                                      },
                                      child: Text('Update Account'))
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

bool isEmailValid(String email) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  return regex.hasMatch(email);
}
