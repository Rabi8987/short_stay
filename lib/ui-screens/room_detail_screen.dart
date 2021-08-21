import 'package:flutter/material.dart';
import 'package:short_stay/ui-screens/bookig_details.dart';
import 'package:short_stay/ui-screens/reservation_info_screen.dart';
import 'package:short_stay/ui-screens/setting_screen.dart';

import 'favourite_screen.dart';
import 'hotel_detail_screen.dart';
import 'hotel_list_screen.dart';

class RoomDetails extends StatefulWidget {
  const RoomDetails({Key key}) : super(key: key);

  @override
  _RoomDetailsState createState() => _RoomDetailsState();
}

class _RoomDetailsState extends State<RoomDetails> {
  String ValueChoose;

  void backButton() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HotelsDetails()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        backButton();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff1f1b51),
          title: Text('Room'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              backButton();
            },
          ),
        ),
        body: Stack(
          children: <Widget>[
            Container(
                foregroundDecoration: BoxDecoration(color: Colors.black26),
                height: 400,
                child: Image.asset('assets/images/r1.jpg', fit: BoxFit.cover)),
            SingleChildScrollView(
              padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 250),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "Standard Single\nRoom",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.all(32.0),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.wifi,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.dinner_dining,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.room_service,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  "\PKR 7000",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                                Text(
                                  "/per night",
                                  style: TextStyle(
                                      fontSize: 12.0, color: Colors.grey),
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 30.0),
                        Text(
                          "Max Guest".toUpperCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 14.0),
                        ),
                        const SizedBox(height: 10.0),
                        Icon(
                          Icons.attribution_outlined,
                          color: Colors.black,
                        ),
                        const SizedBox(height: 30.0),
                        Container(
                          padding: EdgeInsets.only(left: 16, right: 16),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(15)),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            hint: Text('No. of Room'),
                            icon: const Icon(Icons.arrow_drop_down_outlined),
                            iconSize: 24,
                            elevation: 16,
                            underline: SizedBox(),
                            value: ValueChoose,
                            onChanged: (newValue) {
                              setState(() {
                                ValueChoose = newValue;
                              });
                            },
                            items: <String>['One', 'Two', 'Free', 'Four']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        SizedBox(
                          width: double.infinity,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            color: Color(0xff323e78),
                            textColor: Colors.white,
                            child: Text(
                              "Book Now",
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 16.0,
                              horizontal: 32.0,
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ReservationInfo()));
                            },
                          ),
                        ),
                        const SizedBox(height: 30.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          // type: BottomNavigationBarType.shifting,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedIconTheme: IconThemeData(color: Colors.white),
          selectedItemColor: Colors.white,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          backgroundColor: Color(0xff323e78),
          unselectedIconTheme: IconThemeData(
            color: Colors.white,
          ),

          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => CardList()));
                },
                child: Icon(

                  Icons.home,
                  // color: Colors.white,

                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FavouriteScreen()));
                },
                child: Icon(
                  Icons.favorite,
                  color: Colors.white,

                ),
              ),
              label: 'Favourite',
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Setting()));
                },
                child: Icon(
                  Icons.settings,
                  color: Colors.white,

                ),
              ),
              label: 'Setting',
            ),
          ],
        ),
      ),
    );
  }
}
