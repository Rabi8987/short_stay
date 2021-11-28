import 'package:flutter/material.dart';
import 'package:short_stay/models/Bookings.dart';
import 'package:short_stay/services/api.dart';
import 'package:short_stay/ui-screens/bottom_navigation_bar.dart';

import 'history_screen.dart';

class Summary extends StatefulWidget {
  final dynamic booking;

  const Summary({Key key, @required this.booking}) : super(key: key);

  @override
  _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  bool checkIn = false;
  bool checkOut = false;
  bool cancel = false;

  void initState() {
    print(widget.booking['status']);
    if(widget.booking['status'] == "check_in"){
      checkIn = false;
      cancel = false;
      checkOut = true;
    }
    if(widget.booking['status'] == "check_out"){
      checkIn = false;
      cancel = false;
      checkOut = false;
    }
    if(widget.booking['status'] == "pending"){
      checkIn = true;
      cancel = true;
      checkOut = false;
    }
    super.initState();
  }

  updateStatus(String status){
    Future<bool> response = Api().updateBooking(status, widget.booking['id']);
    response.then((value) => {
      if(value)
            {
              if(status == "check_in")
                {
                  setState(() {
                    checkIn = false;
                    checkOut = true;
                  })
                },
              if(status == "check_out")
                {
                  setState(() {
                    checkIn = false;
                    checkOut = false;
                  })
                },

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => historyScreen()))
            }
        });
  }
  CheckInRender(){
    print("here check in");
    if(checkIn){
      print("in check in if");
      return ElevatedButton(
        onPressed: () {
          updateStatus("check_in");
        },
        child: const Text(
          'CHECK IN',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat'),
        ),
        style: ElevatedButton.styleFrom(
          fixedSize: Size(150, 15),
          primary: Colors.blue,
        ),
      );
    }else{
      print("in check in else");
      return Text("");
    }
  }
  CheckOutRender(){
    print("here check in");
    if(checkOut){
      print("in check in if");
      return ElevatedButton(
        onPressed: () {
          updateStatus("check_out");
        },
        child: const Text(
          'CHECK OUT',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat'),
        ),
        style: ElevatedButton.styleFrom(
          fixedSize: Size(150, 15),
          primary: Colors.green,
        ),
      );
    }else{
      print("in check in else");
      return Text("");
    }
  }
  CancelRender(){
    print("here check in");
    if(cancel){
      print("in check in if");
      return ElevatedButton(
        onPressed: () {
          updateStatus("cancelled");
        },
        child: const Text(
          'CANCEL BOOKING',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat'),
        ),
        style: ElevatedButton.styleFrom(
          fixedSize: Size(150, 15),
          primary: Colors.red,
        ),
      );
    }else{
      print("in check in else");
      return Text("");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1f1b51),
        title: Center(child: const Text('Booking Summary')),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                child: ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text(widget.booking['address']),
                ),
              ),
              Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Check In',
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Color(0xff1f1b51)),
                          ),
                          Text(
                            widget.booking['checkin_date'],
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Color(0xff1f1b51)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Check Out',
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Color(0xff1f1b51)),
                          ),
                          Text(
                            widget.booking['checkout_date'],
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Color(0xff1f1b51)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Amount',
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Color(0xff1f1b51)),
                          ),
                          Text(
                            'PKR'+ widget.booking['price'],
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Color(0xff1f1b51)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 6,
              ),
              CheckInRender(),
              SizedBox(height: 20),
              CheckOutRender(),
              SizedBox(height: 20),
              CancelRender(),
            ],
          ),
        ),
      ),
    );
  }
}
