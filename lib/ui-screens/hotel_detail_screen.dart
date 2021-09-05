import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:short_stay/models/HotelDetails.dart';
import 'package:short_stay/models/Rooms.dart';
import 'package:short_stay/services/api.dart';
import 'package:short_stay/ui-screens/bottom_navigation_bar.dart';
import 'package:short_stay/ui-screens/history_screen.dart';
import 'package:short_stay/ui-screens/room_detail_screen.dart';
import 'package:short_stay/ui-screens/setting_screen.dart';
import 'favourite_screen.dart';
import 'hotel_list_screen.dart';

class HotelsDetails extends StatefulWidget {
  final HotelDetails hotel;

  const HotelsDetails({Key key, @required this.hotel}) : super(key: key);

  @override
  _HotelsDetailsState createState() => _HotelsDetailsState();
}

class _HotelsDetailsState extends State<HotelsDetails> {
  CarouselSlider carouselSlider;
  Future<Rooms> _roomData;

  int _current = 0;
  List imgList = [];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  void initState() {
    imgList = widget.hotel.hotel_images;
    _roomData = Api().getHotelRooms(widget.hotel.unique_prefix);
    print(_roomData);
    super.initState();
  }

  void backButton() {
    Navigator.pop(
      context,
      MaterialPageRoute(builder: (context) => bottomBar()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff1f1b51),
          title: Text(widget.hotel.hotel_name),
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
          child: FutureBuilder<Rooms>(
            future: _roomData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 200,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                      ),
                      items: imgList.map((imgUrl) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                color: Colors.green,
                              ),
                              child: Image.network(
                                imgUrl,
                                fit: BoxFit.fill,
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                            itemCount: snapshot.data.data.length,
                            itemBuilder: (context, index) {
                              var room = snapshot.data.data[index];
                              return GestureDetector(
                                onTap: () async {
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.setInt("roomId", room.id);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RoomDetails(
                                            room: room, hotel: widget.hotel),
                                      ));
                                },
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Card(
                                      color: Color(0xff323e78),
                                      clipBehavior: Clip.antiAlias,
                                      elevation: 16,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: AspectRatio(
                                              aspectRatio: 1,
                                              child: Image.network(room.image,
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                          Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            room.category,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          Text(
                                                            room.capacity,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ],
                                                      ),
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
                      ),
                    ),
                  ],
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
