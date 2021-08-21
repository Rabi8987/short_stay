import 'package:flutter/material.dart';
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
          centerTitle: true,
          elevation: 16,
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HotelsDetails()));
              },
              child: Column(
                children: [
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
                                  'assets/images/h1.jpg',
                                ),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Paradise Hotel',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Text('2 bed,1 washroom',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          Text(
                                            'California,Miami',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Icon(
                                      Icons.favorite,
                                      color: Colors.white,
                                    ),
                                  ],
                                )),
                          ],
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
                                  'assets/images/h2.jpg',
                                ),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Paradise Hotel',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Text('2 bed,1 washroom',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          Text(
                                            'California,Miami',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Icon(
                                      Icons.favorite,
                                      color: Colors.white,
                                    ),
                                  ],
                                )),
                          ],
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
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Paradise Hotel',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Text('2 bed,1 washroom',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          Text(
                                            'California,Miami',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Icon(
                                      Icons.favorite,
                                      color: Colors.white,
                                    ),
                                  ],
                                )),
                          ],
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
                                  'assets/images/h4.jpg',
                                ),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Paradise Hotel',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Text('2 bed,1 washroom',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          Text(
                                            'California,Miami',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Icon(
                                      Icons.favorite,
                                      color: Colors.white,
                                    ),
                                  ],
                                )),
                          ],
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
                                  'assets/images/h5.jpg',
                                ),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Paradise Hotel',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Text('2 bed,1 washroom',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          Text(
                                            'California,Miami',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Icon(
                                      Icons.favorite,
                                      color: Colors.white,
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
