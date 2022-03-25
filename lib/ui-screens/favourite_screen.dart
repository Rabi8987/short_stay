import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:short_stay/models/hotel.dart';
import 'package:short_stay/services/api.dart';
import 'package:short_stay/ui-screens/login_screen.dart';
import 'package:short_stay/ui-screens/setting_screen.dart';
import 'hotel_detail_screen.dart';
import 'hotel_list_screen.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key key}) : super(key: key);

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  Future<Hotel> _hotelData;
  int userId;
  String name, email, mobile, username;
  bool session;

  Future<void> initState() {
    getSessionDetails();
    _hotelData = Api().getFavourite();
    print(_hotelData);
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) => init(context));
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

  void removeToFavourite(String unique_prefix) async {
    print(unique_prefix);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt("userId");

    Future<bool> response =
        Api().addToFavourite(unique_prefix, userId, 'delete');
    response.then((value) => {
          if (value) {_hotelData = Api().getFavourite(), setState(() {})}
        });
  }



  screenData() {
    print(session.runtimeType);
    if (session != null) {
      if (session == true) {
        print("i am here");
        return FutureBuilder<Hotel>(
          future: _hotelData,
          builder: (context, snapshot) {
            print(snapshot);
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
                                    child: Image.network(hotel.hotel_images[0],
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
                                                  Text(hotel.hotel_descriptions,
                                                      style: TextStyle(
                                                          color: Colors.white)),
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
                                                  .showSnackBar(const SnackBar(
                                                content: Text(
                                                    'Remove From Favourite'),
                                                duration: Duration(
                                                    seconds: 2,
                                                    milliseconds: 500),
                                              ));
                                              removeToFavourite(
                                                  hotel.unique_prefix);
                                            },
                                            splashColor: Colors.red,
                                            child: Icon(
                                              Icons.favorite,
                                              color: Colors.red,
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
        );
      } else {
        return Center(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xff1f1b51),
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Text('Login')),
        );      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1f1b51),
        title: const Text('My Favourite List'),
        centerTitle: true,
        elevation: 16,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: screenData(),
      ),
    );
  }

}
