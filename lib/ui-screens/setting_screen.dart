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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => loadDetails());
  }

  void loadDetails() {
    getSessionDetails();
    screenData();
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
    if (session == true) {
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    email != null ? email : "",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
      return SizedBox(
        height: MediaQuery.of(context).size.height / 1.25,
        child: Center(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xff1f1b51),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Text('Login')),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
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
