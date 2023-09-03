import 'package:flutter/material.dart';
import 'package:neabuy/profile/help_support_page.dart';
import 'package:neabuy/profile/profile_buttons.dart';
import 'package:neabuy/profile/profile_info.dart';
import 'package:neabuy/profile/settings_page.dart';
import 'package:neabuy/login/login_page.dart';

class ProfilePage extends StatelessWidget {
  // Function to handle the logout logic
  void _handleLogout(BuildContext context) {
    // Implement your logout logic here

    // Show a dialog to confirm the logout
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Implement your actual logout logic here
                // For example, clear user session, navigate to login page, etc.
                Navigator.of(context).pop(); // Close the dialog
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => LoginPage(), // Replace 'LoginPage' with your actual login page
                  ),
                );
              },
              child: Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      appBar: AppBar(
        title: Text('Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ProfileInfoSection(), // Name, Phone Number, and Location
                SizedBox(height: 16.0),
                ProfileButtons(), // Shipped, Payment, and Support buttons
                SizedBox(height: 32.0),
                ListTile(
                  title: Text('Settings'),
                  subtitle: Text('Privacy and Terms and Conditions'),
                  leading: Icon(Icons.settings),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: Colors.yellow,
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => SettingsPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Text('Help & Support'),
                  subtitle: Text('Help center and legal support'),
                  leading: Icon(Icons.help),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: Colors.yellow,
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => HelpSupportPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Text('Logout'),
                  subtitle: Text('Logout from your account'),
                  leading: Icon(Icons.logout),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: Colors.yellow,
                  ),
                  onTap: () {
                    // Call the _handleLogout function to show the confirmation dialog
                    _handleLogout(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
