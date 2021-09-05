import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:short_stay/models/hotel.dart';
import 'package:short_stay/services/api.dart';
import 'package:short_stay/ui-screens/history_screen.dart';
import 'package:short_stay/ui-screens/setting_screen.dart';
import 'favourite_screen.dart';
import 'hotel_detail_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';


class CardList extends StatefulWidget {
  const CardList({Key key}) : super(key: key);

  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  Future<Hotel> _hotelData;
  int userId;
  String name, email, mobile, username;
  bool session;

  // var locationMessage = '';
  //  void getCurrentLocation () async {
  //    var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  //        var lastPosition = await Geolocator.getLastKnownPosition();
  //    print(lastPosition);
  //    setState(() {
  //      locationMessage = "$position.latitude , $position.longitude";
  //    });
  //  }

  @override
  Future<void> initState() {
    getSessionDetails();
    _hotelData = Api().getHotels();
    print(_hotelData);
    super.initState();
    // getCurrentLocation();
  }

  void getSessionDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt("userId");
    name = prefs.getString("full_name");
    email = prefs.getString("email");
    mobile = prefs.getString("mobile");
    username = prefs.getString("username");
    session = prefs.getBool("Session");
    screenData();
    print("zain setting");
    print(userId);
    print(name);
    print(email);
    print(mobile);
    print(username);
    print("session");
    print(session);
  }

  screenData() {
    print(session.runtimeType);
    if (session != null) {
      if (session == true) {
        setState(() {});
        return IconButton(
          icon: Icon(
            Icons.history,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => historyScreen()));
          },
        );
      } else {
        setState(() {});
        return new Text("");
      }
    }
  }

  void addToFavourite(String unique_prefix) async {
    print(unique_prefix);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt("userId");

    Future<bool> response = Api().addToFavourite(unique_prefix, userId, 'add');
    response.then((value) => {});
  }

  DateTime timeBackPressed = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final difference = DateTime.now().difference(timeBackPressed);
        final isExitWarning = difference >= Duration(seconds: 2);
        timeBackPressed = DateTime.now();

        if (isExitWarning) {
          final message = 'Press back to exit';
          Fluttertoast.showToast(msg: message, fontSize: 16);
          return false;
        } else {
          Fluttertoast.cancel();
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff1f1b51),
          title: const Text('Hotels List'),
          actions: <Widget>[screenData()],
          centerTitle: true,
          elevation: 16,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: FutureBuilder<Hotel>(
            future: _hotelData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                      itemCount: snapshot.data.data.length,
                      itemBuilder: (context, index) {
                        var hotel = snapshot.data.data[index];
                        return GestureDetector(
                          onTap: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setString('unique_code', hotel.unique_prefix);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      HotelsDetails(hotel: hotel),
                                ));
                          },
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Card(
                                semanticContainer: true,
                                color: Color(0xff323e78),
                                clipBehavior: Clip.antiAlias,
                                elevation: 16,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AspectRatio(
                                      aspectRatio: 1,
                                      child: Image.network(
                                          hotel.hotel_images[0],
                                          fit: BoxFit.cover),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    // ExpansionPanel(headerBuilder: headerBuilder, body: body)
                                                    Text(
                                                      hotel.hotel_name,
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    Text(
                                                        hotel
                                                            .hotel_descriptions,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white)),
                                                    Text(
                                                      hotel.unique_prefix,
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              customBorder: new CircleBorder(
                                                side: BorderSide(
                                                  width: 3,
                                                ),
                                              ),
                                              onTap: () {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                        const SnackBar(
                                                  content: Text(
                                                      'Added To Favourite'),
                                                  duration: Duration(
                                                      seconds: 2,
                                                      milliseconds: 500),
                                                ));
                                                addToFavourite(
                                                    hotel.unique_prefix);
                                              },
                                              splashColor: Colors.grey,
                                              child: Icon(
                                                Icons.favorite_outline_sharp,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
