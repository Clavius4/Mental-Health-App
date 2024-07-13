import 'package:flutter/material.dart';
import 'package:heet/presentation/assessment_screens/appointments_screen.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../counselllor_matching_screen/patient_details_screen.dart';
import '../home_screen/home_screen.dart';
import '../profile_screen/profile_screen.dart';

class BottomNavScreen extends StatefulWidget {
  static WidgetBuilder builder = (BuildContext context) => BottomNavScreen();

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    AppointmentsScreen(),
    PatientDetailsScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return StylishBottomBar(
      option: DotBarOptions(
        dotStyle: DotStyle.tile,
        gradient: LinearGradient(
          colors: [
            Colors.blue,
            Colors.black,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      items: [
        BottomBarItem(
          icon: Icon(Icons.home_filled),
          title: Text('Home'),
          backgroundColor: Colors.blue,
        ),
        BottomBarItem(
          icon: Icon(Icons.dashboard),
          title: Text('Diagnosis'),
          backgroundColor: Colors.blue,
        ),
        BottomBarItem(
          icon: Icon(Icons.settings),
          title: Text('Patient Details'),
          backgroundColor: Colors.blue,
        ),
        BottomBarItem(
          icon: Icon(Icons.perm_identity),
          title: Text('Profile'),
          backgroundColor: Colors.blue,
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
