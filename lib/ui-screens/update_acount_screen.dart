import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:short_stay/models/User.dart';
import 'package:short_stay/services/api.dart';
import 'package:short_stay/ui-screens/bottom_navigation_bar.dart';
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
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _addressController = TextEditingController();
  final _cnicController = TextEditingController();
  final _checkInController = TextEditingController();

  final TextEditingController controller = TextEditingController();

  String mobile, email, name, username, address, cnic, dob;
  int userId;

  void initState() {
    fillFormData();
    super.initState();
  }

  void fillFormData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString("unique_code"));
    mobile = prefs.getString('mobile');
    email = prefs.getString('email');
    name = prefs.getString('full_name');
    userId = prefs.getInt('userId');
    username = prefs.getString("username");
    address = prefs.getString("address");
    cnic = prefs.getString("cnic");
    dob = prefs.getString("dob");
    _emailController.text = email;
    _mobileController.text = mobile;
    _nameController.text = name;
    _usernameController.text = username;
    _addressController.text = address;
    _cnicController.text = cnic;
    _checkInController.text = dob;
  }

  void updateProfile() {
    final form = _formKey.currentState;
    form.save();

    var user = User.fromJson({
      "id": userId,
      "name": _nameController.text,
      "username": _usernameController.text,
      "email": _emailController.text,
      "address": _addressController.text,
      "cnic": _cnicController.text,
      "dob": _checkInController.text
    });
    Future<bool> response = Api().updateUser(user);
    response.then((value) => {
          if (value)
            {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => bottomBar()))
            }
        });
  }

  void backButton() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => bottomBar()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        backButton();
        return Future.value(false);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Container(
                            child: Text('Update',
                                style: TextStyle(
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
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
              Card(
                elevation: 0,
                color: Colors.transparent,
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                        child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: _emailController,
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
                                  borderSide:
                                      BorderSide(color: Color(0xff1f1b51)))),
                        ),
                        SizedBox(height: 10.0),
                        SizedBox(height: 10.0),
                        TextFormField(
                          controller: _nameController,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'FirstName cannot be empty';
                            } else if (value.length < 3) {
                              return 'FirstName must be at least 3 characters long.';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'FULL NAME ',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff1f1b51)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff1f1b51)))),
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          controller: _usernameController,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'LastName cannot be empty';
                            } else if (value.length < 3) {
                              return 'LastName must be at least 3 characters long.';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'USERNAME ',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff1f1b51)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff1f1b51)))),
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          controller: _addressController,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'LastName cannot be empty';
                            } else if (value.length < 3) {
                              return 'LastName must be at least 3 characters long.';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'ADDRESS ',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff1f1b51)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff1f1b51)))),
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          controller: _cnicController,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'LastName cannot be empty';
                            } else if (value.length < 3) {
                              return 'LastName must be at least 3 characters long.';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'CNIC',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff1f1b51)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff1f1b51)))),
                        ),
                        SizedBox(height: 10.0),
                        DateTimePicker(
                          initialValue: '',
                          // initialValue or controller.text can be null, empty or a DateTime string otherwise it will throw an error.
                          type: DateTimePickerType.date,
                          dateLabelText: 'Date of Birth',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Color(0xff1f1b51)),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now().add(Duration(days: 365)),
                          // This will add one year from current date
                          validator: (value) {
                            return null;
                          },
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              setState(() {
                                _checkInController.text = value;
                              });
                            }
                          },
                          // We can also use onSaved
                          onSaved: (value) {
                            if (value.isNotEmpty) {
                              _checkInController.text = value;
                            }
                          },
                        ),
                        SizedBox(height: 50.0),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xff1f1b51),
                            ),
                            onPressed: () {
                              updateProfile();
                            },
                            child: Text('Update Account'))
                      ],
                    )),
                  ),
                ),
              ),
            ],
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
