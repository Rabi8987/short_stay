import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:short_stay/models/HotelDetails.dart';
import 'package:short_stay/models/RoomDetails.dart';
import 'package:short_stay/ui-screens/reservation_info_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'hotel_detail_screen.dart';
import 'login_screen.dart';
import 'package:flutter_switch/flutter_switch.dart';


class RoomDetails extends StatefulWidget {
  final RoomsDetails room;
  final HotelDetails hotel;

  const RoomDetails({Key key, @required this.room, @required this.hotel})
      : super(key: key);

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
    if (email == null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ReservationInfo(room: widget.room, hotel: widget.hotel)));
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
      onWillPop: () {
        backButton();
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff1f1b51),
          title: Center(child: Text('Room Details')),
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
            // Container(
            //     foregroundDecoration: BoxDecoration(color: Colors.black26),
            //     height: 400,
            //     child: Image.network(widget.room.image, fit: BoxFit.cover)),
            CarouselSlider(
              items: [
                Image.asset('assets/images/1.jpg'),
                Image.asset('assets/images/2.jpg'),
                Image.asset('assets/images/3.jpg'),
                Image.asset('assets/images/4.jpeg'),
              ],
              // .map((e) => ClipRRect(
              //       borderRadius: BorderRadius.circular(8),
              //       child: Stack(
              //         fit: StackFit.expand,
              //         children: <Widget>[
              //           Image.network(
              //             e,
              //             width: 1050,
              //             height: 350,
              //             fit: BoxFit.cover,
              //           )
              //         ],
              //       ),
              //     ))
              // .toList(),
              options: CarouselOptions(
                height: 200,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
            ),
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
                          color: Colors.black,
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
                                  "\PKR" + widget.room.price.toString(),
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

                        const SizedBox(height: 30.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Max Guest".toUpperCase(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.0),
                                ),
                                const SizedBox(height: 10.0),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.attribution_outlined,
                                      color: Colors.black,
                                    ),
                                    Text(
                                      ' : ' + widget.room.capacity,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 30.0),
                        Center(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xff1f1b51),
                              ),
                              onPressed: () {
                                checkUser();
                              },
                              child: Text('Book Room')),
                        ),
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
