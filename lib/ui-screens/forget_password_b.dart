import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:short_stay/models/User.dart';
import 'package:short_stay/services/api.dart';
import 'package:short_stay/ui-screens/bottom_navigation_bar.dart';
import 'package:short_stay/ui-screens/forget_password_c.dart';
import 'package:short_stay/ui-screens/reservation_info_screen.dart';

class fpb extends StatefulWidget {
  final String mobile;

  const fpb({Key key, @required this.mobile}) : super(key: key);

  @override
  _fpbState createState() => _fpbState();
}

class _fpbState extends State<fpb> with TickerProviderStateMixin {
  bool status = false;
  int otp;
  final _optController = TextEditingController();
  bool showOTP = false;
  String mobile;

  void initState() {
    print("zain : ");
    print(widget.mobile);
    Future<int> response = Api().sendOtp(widget.mobile,"forget");
    print(response);
    response.then((value) => {
      if (value != 0)
        {
          otp = value,
          setState(() {
            showOTP = true;
          })
        }
    });
    super.initState();
  }

  tokenRequest(String pin) async {
    setState(() {
      status = true;
    });
    Future<User> _userData;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Future<bool> response = Api().verifyOtp(widget.mobile, pin);
    response.then((value) => {
      if (value != false)
        {
            Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => fpc(mobile: widget.mobile,)))
        }else{
          setState(() {
            status = false;
          }),
          print("else"),
          Fluttertoast.showToast(
              msg: "OTP Is Incorrect",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0)
        }
    });
  }
  void dispose() {
    _optController.dispose();
    super.dispose();
  }
  screenData() {
    if (status) {
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
    } else {
      return ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 64.0),
            child: Text(
              "Verify Mobile Number",
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xff1f1b51), fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0, left: 64.0, right: 64.0),
            child: Text(
              "OTP has been sent on your mobile number please enter it below",
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xff1f1b51), fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 32.0),
            child: PinEntryTextField(
                fields: 4,
                onSubmit: (String pin) {
                  _optController.text = pin;
                  tokenRequest(pin); //end showDialog()
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Text(
              "Didn't Received OTP?",
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xff1f1b51), fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff1f1b51),
                  ),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "RESEND",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: showingOTP(),
          )
        ],
      );
    }
  }

  showingOTP() {
    if (showOTP) {
      return Text("Your otp is : " + otp.toString(),
        style: TextStyle(fontSize: 20,
            fontWeight: FontWeight.bold),);
    } else {
      return Text("");
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: screenData()),
    );
  }
}
