import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/assessment_controller.dart';
import 'assessment5_screen.dart';

class Assessment4Screen extends StatefulWidget {
  const Assessment4Screen({Key? key}) : super(key: key);

  @override
  State<Assessment4Screen> createState() => _Assessment4ScreenState();
}

class _Assessment4ScreenState extends State<Assessment4Screen> {
  final AssessmentController controller = Get.find();
  int? _selectedChoice;

  void _nextQuestion() {
    if (_selectedChoice != null) {
      controller.updateAnswer(0, _selectedChoice!);
      print(controller.answers);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Assessment5Screen(answers: []),
        ),
      );
    } else {
      Get.snackbar('Error', 'Please select an answer before proceeding.', colorText: Colors.red);
    }
  }

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
            "1 of 9",
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
              "Little interest or pleasure in doing things?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 1; i <= 4; i++)
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent, // Constant blue color for rectangular containers
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: RadioListTile<int>(
                      activeColor: Colors.white, // Color for active radio buttons
                      title: Text(
                        i == 1 ? 'Never' : i == 2 ? 'Some of the time' : i == 3 ? 'Much of the time' : 'Nearly all the time',
                        style: TextStyle(color: Colors.black),
                      ),
                      value: i,
                      groupValue: _selectedChoice,
                      onChanged: (value) {
                        setState(() {
                          _selectedChoice = value;
                        });
                      },
                    ),
                  ),
              ],
            ),
            SizedBox(height: 100),
            ElevatedButton(
              onPressed: _nextQuestion,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 50), // Set the minimum size for the button
                backgroundColor: Colors.lightBlue, // Background color for the button
              ),
              child: Text("Next Question", style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
