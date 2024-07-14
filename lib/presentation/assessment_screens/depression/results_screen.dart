import 'package:flutter/material.dart';
import 'package:heet/presentation/assessment_screens/appointments_screen.dart';

import '../../bottom_nav_bar/bottom_nav_bar.dart';
import '../../home_screen/home_screen.dart';

class Results2Screen extends StatelessWidget {
  final String results;

  Results2Screen({required this.results});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: Center(
        child: Text(
          results,
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => BottomNavScreen(),
            ),
                (route) => false, // This condition removes all previous routes
          );
        },
        label: Text('Go Home'),
        icon: Icon(Icons.arrow_circle_right_outlined),
        backgroundColor: Colors.lightBlue,
      ),
    );
  }
}
