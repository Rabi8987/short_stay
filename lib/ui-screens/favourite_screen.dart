import 'package:flutter/material.dart';
import 'package:short_stay/ui-screens/setting_screen.dart';
import 'hotel_detail_screen.dart';
import 'hotel_list_screen.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key key}) : super(key: key);

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  void backButton() {
    Navigator.pop(
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
          title: const Text('My Favourite List'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              backButton();
            },
          ),
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Paradise Hotel',
                                      style: TextStyle(color: Colors.white),
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Paradise Hotel',
                                      style: TextStyle(color: Colors.white),
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Paradise Hotel',
                                      style: TextStyle(color: Colors.white),
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Paradise Hotel',
                                      style: TextStyle(color: Colors.white),
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Paradise Hotel',
                                      style: TextStyle(color: Colors.white),
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
