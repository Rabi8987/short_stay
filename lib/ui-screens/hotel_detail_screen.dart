
import 'package:carousel_pro/carousel_pro.dart';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:short_stay/ui-screens/room_detail_screen.dart';
import 'package:short_stay/ui-screens/setting_screen.dart';
import 'favourite_screen.dart';
import 'hotel_list_screen.dart';

class HotelsDetails extends StatefulWidget {
  const HotelsDetails({Key key}) : super(key: key);

  @override
  _HotelsDetailsState createState() => _HotelsDetailsState();
}

class _HotelsDetailsState extends State<HotelsDetails> {
  CarouselSlider carouselSlider;
  int _current = 0;
  List imgList = [
    'https://images.unsplash.com/photo-1502117859338-fd9daa518a9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1554321586-92083ba0a115?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1543922596-b3bbaba80649?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }
  void backButton() {
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => CardList()),);  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        backButton();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff1f1b51),
          title: const Text('Paradis Hotel '),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              backButton();
            },
          ),
          centerTitle: true,
          elevation: 16,
        ),
        body: Container(
          child: ListView(
            children: [
              Column(
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
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) => RoomDetails()));
                    },
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Card(
                          color: Color(0xff323e78),
                          clipBehavior: Clip.antiAlias,
                          elevation: 16,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Ink.image(
                                  height: 200,
                                  image: AssetImage(
                                    'assets/images/h1.jpg',
                                  ),
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Standard Room',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text('',
                                          style: TextStyle(color: Colors.white)),
                                      Text(
                                        'California,Miami',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  )),
                              ButtonBar()
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) => RoomDetails()));
                    },
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Card(
                          color: Color(0xff323e78),
                          clipBehavior: Clip.antiAlias,
                          elevation: 16,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Ink.image(
                                  height: 200,
                                  image: AssetImage(
                                    'assets/images/h2.jpg',
                                  ),
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Paradise Hotel',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text('2 bed,1 washroom',
                                          style: TextStyle(color: Colors.white)),
                                      Text(
                                        'California,Miami',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  )),
                              ButtonBar()
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        color: Color(0xff323e78),
                        clipBehavior: Clip.antiAlias,
                        elevation: 16,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Ink.image(
                                height: 200,
                                image: AssetImage(
                                  'assets/images/h3.jpg',
                                ),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Paradise Hotel',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text('2 bed,1 washroom',
                                        style: TextStyle(color: Colors.white)),
                                    Text(
                                      'California,Miami',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                )),
                            ButtonBar()
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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


