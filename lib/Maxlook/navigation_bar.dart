import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test3/Maxlook/screens/home.dart';
import 'package:test3/Maxlook/utils/constants.dart';

class MaklookApp extends StatefulWidget {
  static String id = 'MaklookApp';
  const MaklookApp({Key? key}) : super(key: key);

  @override
  State<MaklookApp> createState() => _MaklookAppState();
}

class _MaklookAppState extends State<MaklookApp> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    MaxlookHome(),
    MaxlookHome(),
    MaxlookHome(),
    MaxlookHome(),
    MaxlookHome(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: darkColor,
        fixedColor: orangeColor,
        iconSize: 32,
        unselectedIconTheme:
            IconThemeData(color: lightGreyColor.withOpacity(0.5)),
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bolt_circle),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.heart),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
