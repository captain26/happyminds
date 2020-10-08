import 'dart:collection';

import 'package:discover_therapist/screen/close_screen.dart';
import 'package:discover_therapist/screen/doctor_screen.dart';
import 'package:discover_therapist/screen/home_screen.dart';
import 'package:discover_therapist/screen/tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();


}

class _HomePageState extends State<HomePage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _selectedIndex = 0;

  void onItemTaped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> screenShow = [
    HomeScreen(),
    TabScreen(),
    DoctorScreen(),
    CloseScreen(),
    CloseScreen(),


  ];

  void openDrawer(){
    _scaffoldKey.currentState.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: FlatButton(
          onPressed: openDrawer,
            child: SvgPicture.asset(
          'icons/hamburger.svg', height: 150, width: 150.0,)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Discover',
              style: TextStyle(
                fontSize: 18.0,
                color: Color(0xff072ac8),
              ),
            ),
            Text(
              'Therapists',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.teal,
              ),
            ),
          ],
        ),
        actions: [
          SvgPicture.asset('icons/Notification.svg')
        ],
      ),
      body: Column(
        children: [
          Center(
            child: screenShow.elementAt(_selectedIndex),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset('icons/home.svg'),
              title: Text('hello')
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('icons/journal.svg'),
              title: Text('')

          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'icons/doctor.svg', width: 100, height: 100,),
              title: Text('')
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('icons/Task.svg'),
              title: Text('')
          ), BottomNavigationBarItem(
              icon: SvgPicture.asset('icons/chat.svg'),
              title: Text('')
          ),

        ],
        currentIndex: _selectedIndex,
        onTap: onItemTaped,

      ),
    );
  }
}
