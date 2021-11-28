import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:short_stay/models/BookingDetail.dart';
import 'package:short_stay/models/HotelDetails.dart';
import 'package:short_stay/models/RoomDetails.dart';
import 'package:short_stay/services/api.dart';
import 'package:short_stay/ui-screens/celebrate_booking.dart';
import 'bottom_navigation_bar.dart';


class BookingDetails extends StatefulWidget {
  final BookingDetail booking;
  final RoomsDetails room;
  final HotelDetails hotel;
  final bool ac_status;

  const BookingDetails(
      {Key key,
      @required this.booking,
      @required this.room,
      @required this.hotel,
      @required this.ac_status})
      : super(key: key);

  @override
  _BookingDetailsState createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> with TickerProviderStateMixin  {
  Map<String,dynamic> bookingDetails;
  String checkInDay, checkOutDay;
  int bookingId;
  bool status = false;

  @override
  void initState() {
    // TODO: implement initState
    DateTime checkIndate = DateTime.parse(widget.booking.checkIn);
    DateTime checkOutdate = DateTime.parse(widget.booking.checkOut);
    checkInDay = DateFormat('EEEE').format(checkIndate);
    checkOutDay = DateFormat('EEEE').format(checkOutdate);
    bookNow();
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
    Future<Map<String,dynamic>> roomBooking =
        Api().roomBooking(widget.booking, widget.hotel, widget.room,widget.ac_status);
    // ignore: unrelated_type_equality_checks
    if (roomBooking != false) {
      roomBooking.then((value) => {
            if (value.isNotEmpty)
              {
                setState(() {
                  status = true;
                }),
                bookingDetails = value,
                bookingId = value["bookingId"]
              }else{
              setState(() {
                status = false;
              })
            }
          });
    }
  }

  screenData() {
    if (status == true) {
      print("here if");
      return Container(
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
                      color: Colors.grey,
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
                                  // Row(
                                  //   mainAxisAlignment:
                                  //   MainAxisAlignment.spaceBetween,
                                  //   children: [
                                  //     Text('1 Room',
                                  //         style: TextStyle(
                                  //             color: Colors.black,
                                  //             fontSize: 22)),
                                  //     Text(
                                  //       'PKR ' + widget.room.price.toString()+" per day",
                                  //       style: TextStyle(
                                  //           color: Colors.black,
                                  //           fontSize: 18),
                                  //     ),
                                  //   ],
                                  // ),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(top: 8.0),
                                  //   child: Row(
                                  //     mainAxisAlignment:
                                  //     MainAxisAlignment.spaceBetween,
                                  //     children: [
                                  //       Text('G.S.T',
                                  //           style: TextStyle(
                                  //               color: Colors.black,
                                  //               fontSize: 22)),
                                  //       Text(
                                  //         bookingDetails['gst'].toString(),
                                  //         style: TextStyle(
                                  //             color: Colors.black,
                                  //             fontSize: 18),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  // Divider(
                                  //   height: 50,
                                  //   color: Colors.white,
                                  // ),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(top: 8.0),
                                  //   child: Row(
                                  //     mainAxisAlignment:
                                  //     MainAxisAlignment.spaceBetween,
                                  //     children: [
                                  //       Text('Service Charges',
                                  //           style: TextStyle(
                                  //               color: Colors.black,
                                  //               fontSize: 22)),
                                  //       Text(
                                  //         bookingDetails['service_charges'].toString(),
                                  //         style: TextStyle(
                                  //             color: Colors.black,
                                  //             fontSize: 18),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  // Divider(
                                  //   height: 50,
                                  //   color: Colors.white,
                                  // ),
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
                                          'PKR ' + bookingDetails['total'].toString(),
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
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff1f1b51),
                    ),
                    onPressed: () {

                      updateStatus();

                    },
                    child: Text('Book Now'))
              ],
            ),
          ],
        ),
      );
    } else {
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
    }
  }

  updateStatus(){
    String status = "pending";
    Future<bool> response = Api().updateBooking(status, bookingId);
    response.then((value) => {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => bookingDone()))

    });
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
        body: screenData(),
      ),
    );
  }
}