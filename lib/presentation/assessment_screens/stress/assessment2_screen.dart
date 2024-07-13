import 'package:flutter/material.dart';
import 'package:heet/core/app_export.dart';
import 'package:heet/presentation/assessment_screens/stress/about_stress.dart';

import 'assessment3_screen.dart';

class Assessment2_2Screen extends StatefulWidget {
  const Assessment2_2Screen({Key? key}) : super(key: key);

  @override
  State<Assessment2_2Screen> createState() => _Assessment2_2ScreenState();
}

class _Assessment2_2ScreenState extends State<Assessment2_2Screen> {
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
              "This is a 10 question test for diagnosing, monitoring, and measuring the severity of Stress",
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => Assessment3Screen()));
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 50), // Set the minimum size for the button
                backgroundColor: Colors.lightBlue, // Background color for the first button
              ),
              child: Text("Take Test", style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 40.v),
            TextButton(
              onPressed: () {
                // Add functionality for the text button
                Navigator.push(context, MaterialPageRoute(builder: (context) => AboutStress()));

              },
              child: Text(
                "About Stress",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                  color: Colors.black, // Text color for the text button
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
