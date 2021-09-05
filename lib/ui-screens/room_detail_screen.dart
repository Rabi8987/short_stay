import 'package:flutter/material.dart';
import 'package:short_stay/models/HotelDetails.dart';
import 'package:short_stay/models/RoomDetails.dart';
import 'package:short_stay/ui-screens/bookig_details.dart';
import 'package:short_stay/ui-screens/history_screen.dart';
import 'package:short_stay/ui-screens/reservation_info_screen.dart';
import 'package:short_stay/ui-screens/setting_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'favourite_screen.dart';
import 'hotel_detail_screen.dart';
import 'hotel_list_screen.dart';
import 'login_screen.dart';

class RoomDetails extends StatefulWidget {
  final RoomsDetails room;
  final HotelDetails hotel;

  const RoomDetails({Key key, @required this.room, @required this.hotel}) : super(key: key);

  @override
  _RoomDetailsState createState() => _RoomDetailsState();
}

class _RoomDetailsState extends State<RoomDetails> {
  String ValueChoose;


  void backButton() {
    Navigator.pop(
      context,
      MaterialPageRoute(builder: (context) => HotelsDetails()),
    );
  }
  Future<void> checkUser() async {
    WidgetsFlutterBinding.ensureInitialized();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getString('email');
    if( email == null)
      {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    else{
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ReservationInfo(room: widget.room,hotel: widget.hotel)));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()  {
        backButton();
        return Future.value(true);
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
          automaticallyImplyLeading: false,

        ),
        body: Stack(
          children: <Widget>[
            Container(
                foregroundDecoration: BoxDecoration(color: Colors.black26),
                height: 400,
                child: Image.network(widget.room.image, fit: BoxFit.cover)),
            SingleChildScrollView(
              padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 250),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      widget.room.category,
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
                                          Icons.bathtub_rounded,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          widget.room.animites,
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontFamily: 'MaterialIcons'),
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
                                  "\PKR"+ widget.room.price.toString(),
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
                              checkUser();
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
        // bottomNavigationBar: BottomNavigationBar(
        //   type: BottomNavigationBarType.fixed,
        //
        //   items: <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(
        //       icon: InkWell(
        //           onTap: () {
        //             Navigator.pop(
        //               context,
        //               MaterialPageRoute(builder: (context) => FavouriteScreen()),
        //             );
        //           },
        //           child: Icon(Icons.favorite_outline)),
        //       label: 'Favourite',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: InkWell(
        //           onTap: () {
        //             Navigator.pop(
        //               context,
        //               MaterialPageRoute(builder: (context) => CardList()),
        //             );
        //           },
        //           child: Icon(Icons.home_outlined)),
        //       label: 'Home',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: InkWell(
        //           onTap: () {
        //             Navigator.pop(
        //               context,
        //               MaterialPageRoute(builder: (context) => Setting()),
        //             );
        //           },
        //           child: Icon(Icons.settings)),
        //       label: 'Setting',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: InkWell(
        //           onTap: () {
        //             Navigator.pop(
        //               context,
        //               MaterialPageRoute(builder: (context) => historyScreen()),
        //             );
        //           },
        //           child: Icon(Icons.settings)),
        //       label: 'History',
        //     ),
        //   ],
        //   selectedItemColor: Colors.blue,
        // ),
      ),
    );
  }
}
