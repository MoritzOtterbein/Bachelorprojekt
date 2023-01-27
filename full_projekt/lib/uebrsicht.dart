import 'package:full_projekt/calendar.dart';
import 'package:full_projekt/mapPage.dart';
import 'package:full_projekt/mensa.dart';
import 'package:full_projekt/overview.dart';
import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => Uebersicht();
}

class Uebersicht extends State<MyStatefulWidget> {
  int _selectedIndex = 3;
  final screens = [
    MapPage(),
    Mensa(),
    Calendar(),
    Overview(),
  ];

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Karte',
      style: TextStyle(fontSize: 40),
    ),
    Text(
      'Mensa',
      style: TextStyle(fontSize: 40),
    ),
    Text(
      'Stundenplan',
      style: TextStyle(fontSize: 40),
    ),
    Text(
      'Home',
      style: TextStyle(fontSize: 40),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 45,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Color.fromRGBO(127, 201, 16, 1.0),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.map_outlined,),
              label: "Karte",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.food_bank_outlined,),
              label: "Mensa",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined,),
              label: "Stundenplan",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined,),
              label: "Home",
            ),
          ],
        ),
        body: screens[_selectedIndex],
        ),
      );
  }
}
