import 'package:flutter/material.dart';
import 'package:short_stay/models/Bookings.dart';
import 'package:short_stay/services/api.dart';
import 'package:short_stay/ui-screens/hotel_list_screen.dart';
import 'package:short_stay/ui-screens/summary_screen.dart';

class historyScreen extends StatefulWidget {
  const historyScreen({Key key}) : super(key: key);

  @override
  _historyScreenState createState() => _historyScreenState();
}

class _historyScreenState extends State<historyScreen> {
  Future<Bookings> _bookings;



  void initState() {
    _bookings = Api().getBookings();
    print(_bookings);
    _bookings.then((value) => print(value.data['history'][0]['booking_id']));
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: 'UPCOMING',
                ),
                Tab(text: 'HISTORY'),
              ],
            ),
            title: Center(child: const Text('Booking History')),
            backgroundColor: Color(0xff1f1b51),
            automaticallyImplyLeading: false,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TabBarView(
              children: [
                Column(
                  children: [
                    FutureBuilder<Bookings>(
                        future: _bookings,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return SizedBox(
                              height:
                                  MediaQuery.of(context).size.height / 1.42,
                              child: ListView.builder(
                                  itemCount:
                                      snapshot.data.data['upcoming'].length,
                                  itemBuilder: (context, index) {
                                    var booking = snapshot
                                        .data.data['upcoming'][index];
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Summary(
                                                        booking: booking)));
                                      },
                                      child: Card(
                                        child: ListTile(
                                          leading: Image.network(
                                            booking['hotel_images'],
                                            fit: BoxFit.cover,
                                          ),
                                          title:
                                              Text(booking['hotel_name']),
                                          subtitle: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(booking[
                                                      'checkin_date']),
                                                  Text(booking[
                                                      'checkout_date']),
                                                ],
                                              ),
                                              Text('PKR 7005'),
                                            ],
                                          ),
                                          trailing: Padding(
                                            padding:
                                                const EdgeInsets.all(8.0),
                                            child: Icon(
                                                Icons.arrow_forward_ios),
                                          ),
                                          isThreeLine: true,
                                          dense: true,
                                        ),
                                      ),
                                    );
                                  }),
                            );
                          } else {
                            return Center(
                                child: CircularProgressIndicator());
                          }
                        }),
                  ],
                ),
                Column(
                  children: [
                    FutureBuilder<Bookings>(
                        future: _bookings,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return SizedBox(
                              height:
                                  MediaQuery.of(context).size.height / 1.42,
                              child: ListView.builder(
                                  itemCount:
                                      snapshot.data.data['history'].length,
                                  itemBuilder: (context, index) {
                                    var booking = snapshot
                                        .data.data['history'][index];
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Summary(
                                                        booking: booking)));
                                      },
                                      child: Card(
                                        child: ListTile(
                                          leading: Image.network(
                                            booking['hotel_images'],
                                            fit: BoxFit.cover,
                                          ),
                                          title:
                                              Text(booking['hotel_name']),
                                          subtitle: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(booking[
                                                      'checkin_date']),
                                                  Text(booking[
                                                      'checkout_date']),
                                                ],
                                              ),
                                              Text('PKR 7005'),
                                            ],
                                          ),
                                          trailing: Padding(
                                            padding:
                                                const EdgeInsets.all(8.0),
                                            child: Icon(
                                                Icons.arrow_forward_ios),
                                          ),
                                          isThreeLine: true,
                                          dense: true,
                                        ),
                                      ),
                                    );
                                  }),
                            );
                          } else {
                            return Center(
                                child: CircularProgressIndicator());
                          }
                        }),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
