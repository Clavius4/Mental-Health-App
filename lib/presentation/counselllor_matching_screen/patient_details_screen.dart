import 'package:flutter/material.dart';

class PatientDetailsScreen extends StatefulWidget {
  const PatientDetailsScreen({Key? key}) : super(key: key);

  @override
  State<PatientDetailsScreen> createState() => _PatientDetailsScreenState();
}

class _PatientDetailsScreenState extends State<PatientDetailsScreen> {
  final List<Patient> patients = [
    Patient(
      name: 'John Doe',
      age: 30,
      gender: 'Male',
      contactNumber: '123-456-7890',
    ),
    Patient(
      name: 'Jane Smith',
      age: 25,
      gender: 'Female',
      contactNumber: '987-654-3210',
    ),
    // Add more patients here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text("Patient Details")),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: const Color.fromARGB(255, 224, 240, 255),
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: patients.length,
          itemBuilder: (context, index) {
            return _buildPatientCard(patients[index]);
          },
        ),
      ),
    );
  }

  Widget _buildPatientCard(Patient patient) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              patient.name,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text('Age: ${patient.age}'),
            Text('Gender: ${patient.gender}'),
            Text('Contact: ${patient.contactNumber}'),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.visibility),
                  onPressed: () {
                    _viewPatientDetails(patient);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    _editPatientDetails(patient);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _viewPatientDetails(Patient patient) {
    // Implement view patient details functionality
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Viewing details for ${patient.name}'),
        content: Text('Contact: ${patient.contactNumber}\n'
            'Age: ${patient.age}\n'
            'Gender: ${patient.gender}'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _editPatientDetails(Patient patient) {
    // Implement edit patient details functionality
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditPatientScreen(patient: patient)),
    );
  }
}

class Patient {
  final String name;
  final int age;
  final String gender;
  final String contactNumber;

  Patient({
    required this.name,
    required this.age,
    required this.gender,
    required this.contactNumber,
  });
}

class EditPatientScreen extends StatelessWidget {
  final Patient patient;

  const EditPatientScreen({Key? key, required this.patient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit ${patient.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Name', hintText: patient.name),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Age', hintText: patient.age.toString()),
              keyboardType: TextInputType.number,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Gender', hintText: patient.gender),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Contact Number', hintText: patient.contactNumber),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save edited patient details
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
