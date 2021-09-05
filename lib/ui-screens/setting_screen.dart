import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:short_stay/ui-screens/bottom_navigation_bar.dart';
import 'package:short_stay/ui-screens/login_screen.dart';
import 'package:short_stay/ui-screens/update_acount_screen.dart';
import 'package:short_stay/ui-screens/update_password_screen.dart';
import 'favourite_screen.dart';
import 'hotel_list_screen.dart';

class Setting extends StatefulWidget {
  const Setting({Key key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  int userId;
  String name, email, mobile, username;
  bool session;

  // void backButton() async {
  //   Navigator.pop(
  //     context,
  //     MaterialPageRoute(builder: (context) => bottomBar()),
  //   );
  // }

  @override
  void initState() {
    // TODO: implement initState
    getSessionDetails();

    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) => screenData());
  }

  void getSessionDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt("userId");
    name = prefs.getString("full_name");
    email = prefs.getString("email");
    mobile = prefs.getString("mobile");
    username = prefs.getString("username");
    session = prefs.getBool("Session");
    print("zain setting");
    print(userId);
    print(name);
    print(email);
    print(mobile);
    print(username);
    print("session");
    print(session);
    setState(() {});
  }

  screenData() {
    print(session.runtimeType);
    if (session != null) {
      if (session == true) {
        print("here if");
        return Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: Card(
                  // color: Colors.black12,
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name != null ? name : "",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      email != null ? email : "",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
              )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UpdatePassword()));
                    },
                    child: ListTile(
                      leading: FlutterLogo(),
                      title: Text('Change Password'),
                      trailing: Icon(Icons.arrow_forward),
                    ),
                  ),
                  Divider(),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UpdateAccount()));
                    },
                    child: ListTile(
                      leading: FlutterLogo(),
                      title: Text('Update your Profile'),
                      trailing: Icon(Icons.arrow_forward),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: FlutterLogo(),
                    title: Text('About App'),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                  Divider(),
                  ListTile(
                    leading: FlutterLogo(),
                    title: Text('Term & Conditions'),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.clear();
                      prefs.setBool("Session", false);
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => bottomBar()));
                    },
                    leading: FlutterLogo(),
                    title: Text('Log Out'),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                ],
              ),
            ),
          )
        ]);
      } else {
        setState(() {});
        print("here else");
        return new Column(children: [
          SizedBox(height: MediaQuery.of(context).size.height / 3),
          Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width / 2,
              height: 40.0,
              child: Material(
                borderRadius: BorderRadius.circular(20.0),
                shadowColor: Colors.blueAccent,
                color: Color(0xff1f1b51),
                elevation: 7.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'),
                    ),
                  ),
                ),
              )),
        ]);
      }
    } else {
      return Column(children: [
        SizedBox(height: MediaQuery.of(context).size.height / 3),
        Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width / 2,
            height: 40.0,
            child: Material(
              borderRadius: BorderRadius.circular(20.0),
              shadowColor: Colors.blueAccent,
              color: Color(0xff1f1b51),
              elevation: 7.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat'),
                  ),
                ),
              ),
            )),
      ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // onWillPop: () {
      //   backButton();
      //   return Future.value(false);
      // },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff1f1b51),
          title: const Text('Settings'),
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 16,
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [screenData()],
            ),
          ),
        ),
      ),
    );
  }
}
