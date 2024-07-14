import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PatientDetailsScreen extends StatefulWidget {
  const PatientDetailsScreen({Key? key}) : super(key: key);

  @override
  State<PatientDetailsScreen> createState() => _PatientDetailsScreenState();
}

class _PatientDetailsScreenState extends State<PatientDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text("Assessment Results")),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: const Color.fromARGB(255, 224, 240, 255),
        child: _buildAssessmentResults(),
      ),
    );
  }

  Widget _buildAssessmentResults() {
    final DatabaseReference dbRef = FirebaseDatabase.instance.ref().child('assessment_results');
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    return StreamBuilder<DatabaseEvent>(
      stream: dbRef.orderByChild('user').equalTo(user?.email).onValue,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.snapshot.value != null) {
          Map<dynamic, dynamic> assessments = snapshot.data!.snapshot.value as Map<dynamic, dynamic>;

          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: assessments.length,
            itemBuilder: (context, index) {
              var key = assessments.keys.elementAt(index);
              var result = assessments[key];

              return Card(
                elevation: 4.0,
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Assessment Result',
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text('Result: ${result['result']}'),
                      Text('Timestamp: ${result['timestamp']}'),
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return const Center(
            child: Text('No assessments done yet.'),
          );
        }
      },
    );
  }
}
