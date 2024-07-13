import 'package:flutter/material.dart';
import 'package:heet/core/app_export.dart';

import 'assessment4_screen.dart';

class Assessment3Screen extends StatefulWidget {
  const Assessment3Screen({Key? key}) : super(key: key);

  @override
  State<Assessment3Screen> createState() => _Assessment3ScreenState();
}

class _Assessment3ScreenState extends State<Assessment3Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Center(
          child: Text(
            "Stress Test",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Thinking about the past 2 weeks, to what extent have you found the following things a problem? Tap 'Continue' to start Diagnosis",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 150.v),
            ElevatedButton(
              onPressed: () {
                // Add functionality for the first button
                Navigator.push(context, MaterialPageRoute(builder: (context) => Assessment4Screen()));
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 50), // Set the minimum size for the button
                backgroundColor: Colors.lightBlue, // Background color for the first button
              ),
              child: Text("Continue", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
