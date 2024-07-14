import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/assessment_controller.dart';
import 'results_screen.dart';

class Assessment10Screen extends StatefulWidget {
  @override
  State<Assessment10Screen> createState() => _Assessment10ScreenState();
}

class _Assessment10ScreenState extends State<Assessment10Screen> {
  final AssessmentController controller = Get.find();
  final DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  final FirebaseAuth auth = FirebaseAuth.instance;
  int? _selectedChoice;

  @override
  Widget build(BuildContext context) {
    Future<void> _submitAnswers() async {
      User? user = auth.currentUser;

      if (_selectedChoice != null && user != null) {
        // Fetch user's email from the 'users' collection in Firebase Realtime Database
        DataSnapshot snapshot = await dbRef.child('users')
            .child(user.uid)
            .get();

        if (snapshot.exists) {
          String email = snapshot
              .child('emailAddress')
              .value
              .toString();

          controller.updateAnswer(15, _selectedChoice!);
          print(controller.answers);

          // Assess the disease and get results
          String results = controller.assessDisease(
              'Anxiety'); // Change disease as needed

          // Save results to Firebase Realtime Database
          dbRef.child('assessment_results').push().set({
            'user': email,
            'result': results,
            'timestamp': DateTime.now().toIso8601String(),
          }).then((_) {
            Get.snackbar('Success', 'Successfully saved results:',
                colorText: Colors.green);
            // Navigate to ResultsScreen with the computed results
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultsScreen(results: results),
              ),
            );
          }).catchError((error) {
            Get.snackbar('Error', 'Failed to save results: $error',
                colorText: Colors.red);
          });
        } else {
          Get.snackbar('Error', 'Please select an answer before submitting.',
              colorText: Colors.red);
        }
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
            "7 of 7",
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
              "Feeling afraid as if something awful might happen?",
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
              onPressed: _submitAnswers,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 50),
                backgroundColor: Colors.lightBlue,
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
