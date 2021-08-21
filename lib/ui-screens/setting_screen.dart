import 'package:flutter/material.dart';
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
  void backButton() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CardList()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        backButton();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff1f1b51),
          title: const Text('Settings'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CardList()),
              );            },
          ),
          centerTitle: true,
          elevation: 16,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
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
                          'Zain Hussain',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          'Zain.hussain@gmail.com',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
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
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => UpdatePassword()));
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
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => UpdateAccount()));
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
                        leading: FlutterLogo(),
                        title: Text('Log Out'),
                        trailing: Icon(Icons.arrow_forward),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          // type: BottomNavigationBarType.shifting,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedIconTheme: IconThemeData(color: Colors.white),
          selectedItemColor: Colors.white,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          backgroundColor: Color(0xff323e78),
          unselectedIconTheme: IconThemeData(
            color: Colors.white,
          ),

          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => CardList()));
                },
                child: Icon(

                  Icons.home,
                  // color: Colors.white,

                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FavouriteScreen()));
                },
                child: Icon(
                  Icons.favorite,
                  color: Colors.white,

                ),
              ),
              label: 'Favourite',
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Setting()));
                },
                child: Icon(
                  Icons.settings,
                  color: Colors.white,

                ),
              ),
              label: 'Setting',
            ),
          ],
        ),
      ),
    );
  }
}
