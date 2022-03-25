import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:short_stay/models/hotel.dart';
import 'package:short_stay/services/api.dart';
import 'package:short_stay/ui-screens/city_list.dart';
import 'hotel_detail_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

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
  bool check;
  String Address = 'search';
  double lat, long;

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    lat = position.latitude;
    long = position.longitude;
    return position;
  }

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    Address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(() {});
  }

  @override
  Future<void> initState() {
    getSessionDetails();
    Future<Position> position = _getGeoLocationPosition();
    position.then((value) => {
          GetAddressFromLatLong(value),
          _hotelData = null,
          getCity().then((value) => {
                _hotelData = Api().getHotels(lat, long, value),
              })
        });
    setState(() {});
    super.initState();
  }

  Future<String> getCity() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.get("city");
  }

  void getSessionDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt("userId");
    name = prefs.getString("full_name");
    email = prefs.getString("email");
    mobile = prefs.getString("mobile");
    username = prefs.getString("username");
    session = prefs.getBool("Session");
    userId = prefs.getInt("userId");
  }

  bool addToFavourite(String unique_prefix) {
    if (userId != null) {
      Future<bool> response =
          Api().addToFavourite(unique_prefix, userId, 'add');
      print(response);
      check = true;
      return check;
    } else {
      check = false;
      return check;
    }
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
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => cityList()));
              },
              icon: Icon(Icons.my_location),
            ),
          ],
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
                                                    const SizedBox(
                                                        height: 10.0),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "Rating".toUpperCase() +
                                                              ' ' +
                                                              hotel.rating +
                                                              ' ',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Icon(
                                                          Icons.star,
                                                          color: Colors.white,
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Column(
                                              children: [
                                                // Text("Distance".toUpperCase()+
                                                //     hotel.distance +
                                                //     'KM',
                                                //     style: TextStyle(
                                                //         color: Colors.white)),
                                                // const SizedBox(height: 10.0),
                                                // Text("Min.Price".toUpperCase() +
                                                //     ' ' +
                                                //     hotel.minprice +
                                                //     'PKR',
                                                //     style: TextStyle(
                                                //         color: Colors.white)),
                                                const SizedBox(height: 10.0),
                                                InkWell(
                                                  customBorder:
                                                      new CircleBorder(
                                                    side: BorderSide(
                                                      width: 3,
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    bool tempChecl =
                                                        addToFavourite(hotel
                                                            .unique_prefix);
                                                    if (tempChecl) {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              const SnackBar(
                                                        content: Text(
                                                            'Added To Favourite'),
                                                        duration: Duration(
                                                            seconds: 2,
                                                            milliseconds: 500),
                                                      ));
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              const SnackBar(
                                                        content: Text(
                                                            'You are not logged in.'),
                                                        duration: Duration(
                                                            seconds: 2,
                                                            milliseconds: 500),
                                                      ));
                                                    }
                                                  },
                                                  splashColor: Colors.grey,
                                                  child: Icon(
                                                    Icons
                                                        .favorite_outline_sharp,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
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
