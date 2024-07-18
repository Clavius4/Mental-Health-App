import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class PersonalInformationScreen extends StatefulWidget {
  @override
  _PersonalInformationScreenState createState() => _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _database = FirebaseDatabase.instance.ref();
  User? _user;
  DatabaseReference? _userRef;
  Map<String, dynamic> _userInfo = {};

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser;
    if (_user != null) {
      _userRef = _database.child('users/${_user!.uid}');
      _fetchUserInfo();
    }
  }

  void _fetchUserInfo() {
    _userRef!.onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>;
      setState(() {
        _userInfo = data.map((key, value) => MapEntry(key.toString(), value));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Information'),
      ),
      body: _user == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildInfoTile(
              icon: Icons.person,
              label: 'First Name',
              value: _userInfo['firstName'] ?? 'N/A',
            ),
            _buildInfoTile(
              icon: Icons.person,
              label: 'Last Name',
              value: _userInfo['lastName'] ?? 'N/A',
            ),
            _buildInfoTile(
              icon: Icons.phone,
              label: 'Phone Number',
              value: _userInfo['phoneNumber'] ?? 'N/A',
            ),
            _buildInfoTile(
              icon: Icons.email,
              label: 'Email Address',
              value: _user!.email ?? 'N/A',
            ),
            // Add more personal information tiles here
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon),
        title: Text(label),
        subtitle: Text(value),
      ),
    );
  }
}
