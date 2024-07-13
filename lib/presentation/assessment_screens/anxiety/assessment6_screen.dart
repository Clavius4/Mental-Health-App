import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/assessment_controller.dart';
import 'assessment7_screen.dart';

class Assessment6Screen extends StatefulWidget {
  Assessment6Screen({Key? key, required List answers}) : super(key: key);

  @override
  State<Assessment6Screen> createState() => _Assessment6ScreenState();
}

class _Assessment6ScreenState extends State<Assessment6Screen> {
  final AssessmentController controller = Get.find<AssessmentController>();
  int? _selectedChoice;

  void _nextQuestion() {
    if (_selectedChoice != null) {
      controller.updateAnswer(11, _selectedChoice!);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Assessment7Screen(answers: []),
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
          onPressed: () => Get.back(),
        ),
        title: Center(
          child: Text(
            "3 of 7",
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
              "Worrying too much about different things?",
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
                for (int i = 0; i <= 3; i++)
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: RadioListTile<int>(
                      activeColor: Colors.white,
                      title: Text(
                        i == 0
                            ? 'Never'
                            : i == 1
                            ? 'Some of the time'
                            : i == 2
                            ? 'Much of the time'
                            : 'Nearly all the time',
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
                minimumSize: Size(200, 50),
                backgroundColor: Colors.lightBlue,
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
