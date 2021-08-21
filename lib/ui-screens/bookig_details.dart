import 'package:flutter/material.dart';
import 'package:short_stay/ui-screens/room_detail_screen.dart';
import 'package:short_stay/ui-screens/setting_screen.dart';
import 'favourite_screen.dart';
import 'hotel_list_screen.dart';

class BookingDetails extends StatefulWidget {
  const BookingDetails({Key key}) : super(key: key);

  @override
  _BookingDetailsState createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  void backButton() {
    Navigator.pop(
      context,
      MaterialPageRoute(builder: (context) => RoomDetails()),
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
          title: const Text('Reservation Details '),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              backButton();
            },
          ),
          centerTitle: true,
          elevation: 16,
        ),
        body: Container(
          child: ListView(
            children: [
              Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        // color: Color(0xff323e78),
                        clipBehavior: Clip.antiAlias,
                        elevation: 16,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Ink.image(
                                height: 200,
                                image: AssetImage(
                                  'assets/images/h1.jpg',
                                ),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Rzzh Hotel Room',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                          'standard hotel Room is booked with 2 bed and 2 bath & other facilities',
                                          style:
                                              TextStyle(color: Colors.black)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        'California, street #5 near sector 8',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      height: 50,
                                      color: Colors.grey,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Check In',
                                              style: TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 24),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Text('16 Aug',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 22)),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Text(
                                                'Monday',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Check Out',
                                              style: TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 24),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Text('20 Aug',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 22)),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Text(
                                                'Friday',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Payment Amount',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        color: Colors.black26,
                        clipBehavior: Clip.antiAlias,
                        elevation:4,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('1 Room',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 22)),
                                        Text(
                                          'PKR 7000',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('G.S.T',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 22)),
                                          Text(
                                            'PKR 910',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 50,
                                      color: Colors.white,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Total Price',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontStyle: FontStyle.italic,
                                                  fontSize: 22)),
                                          Text(
                                            'PKR 7910',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontStyle: FontStyle.italic,

                                                fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
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
