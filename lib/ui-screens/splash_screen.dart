import 'package:flutter/material.dart';
import 'package:short_stay/ui-screens/hotel_list_screen.dart';
import 'dart:async';

import 'bottom_navigation_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 4),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => bottomBar())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset('assets/images/splash.jpg'),
            ),
          ],
        ),
      ),
    );
  }
}
