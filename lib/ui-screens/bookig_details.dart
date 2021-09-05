import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:short_stay/models/BookingDetail.dart';
import 'package:short_stay/models/HotelDetails.dart';
import 'package:short_stay/models/RoomDetails.dart';
import 'package:short_stay/services/api.dart';
import 'package:short_stay/ui-screens/history_screen.dart';
import 'package:short_stay/ui-screens/room_detail_screen.dart';
import 'package:short_stay/ui-screens/setting_screen.dart';
import 'bottom_navigation_bar.dart';
import 'favourite_screen.dart';
import 'hotel_list_screen.dart';

class BookingDetails extends StatefulWidget {
  final BookingDetail booking;
  final RoomsDetails room;
  final HotelDetails hotel;

  const BookingDetails(
      {Key key,
      @required this.booking,
      @required this.room,
      @required this.hotel})
      : super(key: key);

  @override
  _BookingDetailsState createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {

  String checkInDay, checkOutDay;

  @override
  void initState() {
    // TODO: implement initState
    DateTime checkIndate = DateTime.parse(widget.booking.checkIn);
    DateTime checkOutdate = DateTime.parse(widget.booking.checkOut);
    checkInDay = DateFormat('EEEE').format(checkIndate);
    checkOutDay = DateFormat('EEEE').format(checkOutdate);
    super.initState();
  }

  void backButton() {
    Navigator.pop(
      context,
      MaterialPageRoute(builder: (context) => bottomBar()),
    );
  }

  void bookNow() {
    print('room booking');
    Future<bool> roomBooking =
        Api().roomBooking(widget.booking, widget.hotel, widget.room);
    // ignore: unrelated_type_equality_checks
    if (roomBooking != false) {
      roomBooking.then((value) => {
            if (value)
              {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => bottomBar(),
                    )),
              }
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        backButton();
        return Future.value(false);
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
          automaticallyImplyLeading: false,
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
                              child: Image.network(widget.hotel.hotel_images[0],
                                  fit: BoxFit.cover),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.hotel.hotel_name,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                          widget.hotel.hotel_descriptions,
                                          style:
                                              TextStyle(color: Colors.black)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        widget.hotel.rating.toString(),
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
                                              child: Text(
                                                  widget.booking.checkIn,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 22)),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Text(
                                                checkInDay,
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
                                              child: Text(
                                                  widget.booking.checkOut,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 22)),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Text(
                                                checkOutDay,
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
                        elevation: 4,
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
                                          'PKR ' + widget.room.price.toString(),
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
                                            '13%',
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
                                            'PKR ' +
                                                ((widget.room.price * 0.13) +
                                                        widget.room.price)
                                                    .toString(),
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.blueAccent,
                          color: Color(0xff1f1b51),
                          elevation: 7.0,
                          child: GestureDetector(
                            onTap: () {
                              bookNow();
                            },
                            child: Center(
                              child: Text(
                                'Book Now',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        )),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
