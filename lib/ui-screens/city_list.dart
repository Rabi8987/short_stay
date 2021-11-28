import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:short_stay/models/Cities.dart';
import 'package:short_stay/models/cityList.dart';
import 'package:short_stay/services/api.dart';
import 'package:short_stay/ui-screens/bottom_navigation_bar.dart';
import 'package:short_stay/ui-screens/hotel_list_screen.dart';
import 'package:short_stay/ui-screens/login_screen.dart';

class cityList extends StatefulWidget {
  const cityList({Key key}) : super(key: key);

  @override
  _cityListState createState() => _cityListState();
}

class _cityListState extends State<cityList> {
  Future<City> _cityData;
  int userId;
  String name, email, mobile, username;
  bool session;

  @override
  Future<void> initState() {
    print(_cityData);
    _cityData = Api().getCities();

    super.initState();
  }

  void backButton() {
    Navigator.pop(
      context,
      MaterialPageRoute(builder: (context) => bottomBar()),
    );
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
    return FutureBuilder<City>(
      future: _cityData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount:
              snapshot.data.data.length,
              itemBuilder: (context, index) {
                var cities = snapshot
                    .data.data[index];
                return GestureDetector(
                    onTap: () async{
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setString("city", cities.city);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => bottomBar()),
                      );
                    },
                  child: Card(
                    child: ListTile(
                      title: Text(cities.city),
                      dense: true,
                    ),
                  ),

                );
              });
        } else {
          return Center(
              child: CircularProgressIndicator());
        }
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        backButton();
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff1f1b51),
          title: const Text('City Lists '),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              backButton();
            },
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 16,
        ),
        body: screenData(),
      ),
    );
  }
}
