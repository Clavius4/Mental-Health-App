import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:heet/presentation/assessment_screens/depression/results_screen.dart';
import '../controllers/assessment_controller.dart';


class Assessment12Screen extends StatefulWidget {
  const Assessment12Screen({Key? key, required List answers}) : super(key: key);

  @override
  State<Assessment12Screen> createState() => _Assessment12ScreenState();
}

class _Assessment12ScreenState extends State<Assessment12Screen> {
  final AssessmentController controller = Get.find();
  int? _selectedChoice;

  @override
  Widget build(BuildContext context) {
    void _submitAnswers() {
      if (_selectedChoice != null) {
        controller.updateAnswer(8, _selectedChoice!);
        print(controller.answers);

        // Assess the disease and get results
        String results = controller.assessDisease('Depression'); // Change disease as needed

        // Navigate to ResultsScreen with the computed results
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Results2Screen(results: results),
          ),
        );
      } else {
        Get.snackbar('Error', 'Please select an answer before submitting.', colorText: Colors.red);
      }
    }
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
            "9 of 9",
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
              "Trouble concentrating on things such as reading?",
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
              onPressed: _submitAnswers,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 50), // Set the minimum size for the button
                backgroundColor: Colors.lightBlue, // Background color for the button
              ),
              child: Text("Submit", style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
