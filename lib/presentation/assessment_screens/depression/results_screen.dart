import 'package:flutter/material.dart';
import 'package:heet/presentation/assessment_screens/appointments_screen.dart';

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
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AppointmentsScreen(),
            ),
          );
        },
        label: Text('Go Home'),
        icon: Icon(Icons.arrow_circle_right_outlined),
        backgroundColor: Colors.lightBlue,
      ),
    );
  }
}