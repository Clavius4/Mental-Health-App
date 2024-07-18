import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:heet/presentation/log_in_screen/log_in_screen.dart';
import 'package:heet/presentation/profile_screen/personal_info_details.dart';
import 'package:heet/presentation/profile_screen/settings.dart';
import 'package:provider/provider.dart';
import 'change_password_dialog.dart';
import 'faqs.dart';
import 'terms.dart';
import 'provider/profile_provider.dart';



class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  ProfileScreenState createState() => ProfileScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileProvider(),
      child: const ProfileScreen(),
    );
  }
}

class ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  String? _firstName;
  String? _lastName;
  String? _emailAddress;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DatabaseReference userRef = _database.ref().child('users').child(user.uid);

      // Fetching user data
      DataSnapshot snapshot = await userRef.get();

      if (snapshot.value != null) {
        Map<String, dynamic> userData = Map<String, dynamic>.from(snapshot.value as Map);

        setState(() {
          _firstName = userData['firstName'];
          _lastName = userData['lastName'];
          _emailAddress = user.email;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Profile")),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: const Color.fromARGB(255, 224, 240, 255),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 20),
            _buildProfileTile(
              icon: Icons.person,
              title: 'Personal Information',
              subtitle: 'Name, Phone, email, etc.',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PersonalInformationScreen(),
                  ),
                );
              },
            ),
            _buildProfileTile(
              icon: Icons.lock,
              title: 'Change Password',
              subtitle: 'Update your password',
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ChangePasswordDialog();
                  },
                );
              },
            ),

            _buildProfileTile(
              icon: Icons.settings,
              title: 'Settings',
              subtitle: 'Account settings',
              onTap: () {
                // Implement navigation to settings screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsScreen(),
                  ),
                );
              },
            ),
            _buildProfileTile(
              icon: Icons.notifications,
              title: 'Terms and Conditions',
              subtitle: 'Read the terms and conditions',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TermsAndConditionsScreen()));
              },
            ),
            _buildProfileTile(
              icon: Icons.help,
              title: 'Help & Support',
              subtitle: 'FAQs, Contact support',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => FAQScreen()));
              },
            ),
            _buildProfileTile(
              icon: Icons.logout,
              title: 'Logout',
              subtitle: 'Sign out from your account',
              onTap: _showLogoutDialog,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 40,
              // backgroundImage: AssetImage('assets/images/profile_picture.png'), // Replace with your profile image asset
            ),
            const SizedBox(height: 10),
            Text(
              '${_firstName ?? ''} ${_lastName ?? ''}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              _emailAddress ?? '',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 1.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        leading: Icon(icon, color: const Color.fromARGB(255, 31, 115, 183)),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Implement logout functionality
                Navigator.of(context).pop();
                FirebaseAuth.instance.signOut().then((value) => {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LogInScreen()))
                });
                // AuthService.logout(context);
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }




}
