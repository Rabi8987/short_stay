import 'package:flutter/material.dart';
import 'package:short_stay/ui-screens/reservation_info_screen.dart';
import 'package:short_stay/ui-screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      // home: ReservationInfo(),
    );
  }
}
