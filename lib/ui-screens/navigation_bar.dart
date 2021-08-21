import 'package:flutter/material.dart';
import 'package:short_stay/ui-screens/room_detail_screen.dart';
import 'package:short_stay/ui-screens/setting_screen.dart';
import 'package:short_stay/ui-screens/update_acount_screen.dart';
import 'package:short_stay/ui-screens/update_password_screen.dart';

import 'bookig_details.dart';
import 'favourite_screen.dart';
import 'hotel_detail_screen.dart';
import 'hotel_list_screen.dart';

class NavigationBar extends StatefulWidget {
  const NavigationBar({Key key}) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    CardList(),
    FavouriteScreen(),
    Setting(),
    //other pages
    BookingDetails(),
    RoomDetails(),
    UpdateAccount(),
    UpdatePassword(),

  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text(
              'Home',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_outline_rounded,
            ),
            title: Text(
              'Favourite',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            title: Text(
              'Setting',
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        selectedFontSize: 13.0,
        unselectedFontSize: 13.0,
      ),
    );
  }
}
