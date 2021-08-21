import 'package:flutter/material.dart';
import 'package:short_stay/ui-screens/login_screen.dart';
import 'package:short_stay/ui-screens/register_screen.dart';
import 'package:short_stay/ui-screens/splash_screen.dart';
import 'package:short_stay/ui-screens/update_acount_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      // home: UpdateAccount(),
      home: SplashScreen(),
    );
  }
}

