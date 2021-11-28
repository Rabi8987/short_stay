import 'package:flutter/material.dart';
import 'package:short_stay/ui-screens/setting_screen.dart';

import 'favourite_screen.dart';
import 'history_screen.dart';
import 'hotel_list_screen.dart';

class bottomBar extends StatefulWidget {
  const bottomBar({Key key}) : super(key: key);

  @override
  _bottomBarState createState() => _bottomBarState();
}

class _bottomBarState extends State<bottomBar> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    CardList(),
    FavouriteScreen(),
    historyScreen(),
    Setting(),
  ];

  void _onItemTapped(int index) {
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
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_sharp),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
