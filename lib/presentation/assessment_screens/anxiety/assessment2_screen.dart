import 'package:flutter/material.dart';
import 'package:heet/core/app_export.dart';
import 'package:heet/presentation/assessment_screens/anxiety/about_anxiety.dart';

import 'assessment3_screen.dart';

class Assessment2_1Screen extends StatefulWidget {
  const Assessment2_1Screen({Key? key}) : super(key: key);

  @override
  State<Assessment2_1Screen> createState() => _Assessment2_1ScreenState();
}

class _Assessment2_1ScreenState extends State<Assessment2_1Screen> {
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
            "Anxiety Test",
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
              "This is a 7 question test for diagnosing, monitoring, and measuring the severity of Anxiety",
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => AboutAnxiety()));
              },
              child: Text(
                "About Anxiety",
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
