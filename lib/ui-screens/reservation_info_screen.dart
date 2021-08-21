import 'package:flutter/material.dart';
import 'package:short_stay/ui-screens/bookig_details.dart';

import 'login_screen.dart';

class ReservationInfo extends StatefulWidget {
  const ReservationInfo({Key key}) : super(key: key);

  @override
  _ReservationInfoState createState() => _ReservationInfoState();
}

class _ReservationInfoState extends State<ReservationInfo> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: SingleChildScrollView(
          child: Container(
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
                          child: Text(
                            'Enter you details',
                            style: TextStyle(
                                fontSize: 40.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(315.0, 75.0, 0.0, 0.0),
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
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.only(
                                  top: 35.0, left: 20.0, right: 20.0),
                              child: Column(
                                children: <Widget>[
                                  TextField(
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
                                  TextField(
                                    decoration: InputDecoration(
                                        labelText: 'PHONE NUMBER ',
                                        labelStyle: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black38),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xff1f1b51)))),
                                    obscureText: true,
                                  ),
                                  SizedBox(height: 10.0),
                                  TextField(
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
                                  TextField(
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
                                  SizedBox(height: 10.0),
                                  TextField(
                                    decoration: InputDecoration(
                                        labelText: 'TOTAL PERSON ',
                                        labelStyle: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black38),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xff1f1b51)))),
                                  ),
                                  TextField(
                                    maxLines: 3,
                                    decoration: InputDecoration(
                                        labelText: 'SPECIAL REQUEST ',
                                        labelStyle: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black38),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xff1f1b51)))),
                                  ),                                SizedBox(height: 50.0),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Container(
                                        height: 40.0,
                                        child: Material(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          shadowColor: Colors.blueAccent,
                                          color: Color(0xff1f1b51),
                                          elevation: 7.0,
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          BookingDetails()));
                                            },
                                            child: Center(
                                              child: Text(
                                                'Confirm Details',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Montserrat'),
                                              ),
                                            ),
                                          ),
                                        )),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
        ));
  }
}
