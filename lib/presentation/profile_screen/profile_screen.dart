import 'package:flutter/material.dart';
import 'package:heet/presentation/profile_screen/terms.dart';
import '../../core/app_export.dart';
import '../../services/authService.dart';
import 'faqs.dart';
import 'provider/profile_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key})
      : super(
          key: key,
        );

  @override
  ProfileScreenState createState() => ProfileScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileProvider(),
      child: ProfileScreen(),
    );
  }
}

class ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Profile")),
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
              subtitle: 'Name, Age, Gender, etc.',
              onTap: () {

              },
            ),
            _buildProfileTile(
              icon: Icons.lock,
              title: 'Change Password',
              subtitle: 'Update your password',
              onTap: _showChangePasswordDialog,
            ),
            _buildProfileTile(
              icon: Icons.settings,
              title: 'Settings',
              subtitle: 'Account settings, Preferences',
              onTap: () {
                // Implement navigation to settings screen
              },
            ),
            _buildProfileTile(
              icon: Icons.notifications,
              title: 'Terms and Conditions',
              subtitle: 'Read the terms and conditions',
              onTap: () {
                // Implement navigation to notifications settings screen
                Navigator.push(context, MaterialPageRoute(builder: (context) => TermsAndConditionsScreen()));

              },
            ),
            _buildProfileTile(
              icon: Icons.help,
              title: 'Help & Support',
              subtitle: 'FAQs, Contact support',
              onTap: () {
                // Implement navigation to help and support screen
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
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/images/profile_picture.png'), // Replace with your profile image asset
            ),
            SizedBox(height: 10),
            Text(
              'John Doe',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'john.doe@example.com',
              style: TextStyle(
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

  void _showChangePasswordDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Change Password'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Current Password',
                ),
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'New Password',
                ),
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm New Password',
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Change'),
              onPressed: () {
                // Implement change logic
                Navigator.of(context).pop();
                // Optionally, add a function to handle the password update
              },
            ),
          ],
        );
      },
    );
  }

  void _showThemeSelectionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Theme'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RadioListTile<String>(
                title: const Text('Light'),
                value: 'light',
                groupValue: 'selectedTheme', // This should be a state variable
                onChanged: (String? value) {
                  // Update the theme state
                  Navigator.pop(context);
                },
              ),
              RadioListTile<String>(
                title: const Text('Dark'),
                value: 'dark',
                groupValue: 'selectedTheme', // This should be a state variable
                onChanged: (String? value) {
                  // Update the theme state
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _showLanguageSelectionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Language'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RadioListTile<String>(
                title: const Text('English'),
                value: 'english',
                groupValue: 'selectedLanguage', // This should be a state variable
                onChanged: (String? value) {
                  // Update the language state
                  Navigator.pop(context);
                },
              ),
              RadioListTile<String>(
                title: const Text('Swahili'),
                value: 'swahili',
                groupValue: 'selectedLanguage', // This should be a state variable
                onChanged: (String? value) {
                  // Update the language state
                  Navigator.pop(context);
                },
              ),
              RadioListTile<String>(
                title: const Text('French'),
                value: 'french',
                groupValue: 'selectedLanguage', // This should be a state variable
                onChanged: (String? value) {
                  // Update the language state
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
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
                AuthService.logout(context);
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}

class SharedAppBar {
  const SharedAppBar();
}
