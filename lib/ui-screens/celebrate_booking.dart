import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'bottom_navigation_bar.dart';

class bookingDone extends StatefulWidget {
  const bookingDone({Key key}) : super(key: key);

  @override
  _bookingDoneState createState() => _bookingDoneState();
}

class _bookingDoneState extends State<bookingDone>
    with SingleTickerProviderStateMixin {
  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tap back again to leave'),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'Booking Confirmed',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset('assets/images/done.jpg'),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff1f1b51),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => bottomBar()));
                  },
                  child: Text('Back to home')),
            )
          ],
        ),
      ),
    );
  }
}
