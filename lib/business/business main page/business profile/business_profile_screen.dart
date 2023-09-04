import 'package:flutter/material.dart';
import 'package:neabuy/login/login_page.dart';

class ProfileScreen extends StatelessWidget {
  // Add your profile information here
  final String storeName = 'My Store';
  final String address = '123 Main St, City, Country';
  final String taxInformation = 'Tax ID: 123456789';

  // Function to handle logout
  void handleLogout(BuildContext context) {
    // Implement your logout logic here
    // For example, you can clear user data, navigate to the login screen, etc.
    // Replace the following line with your actual logout logic.
    Navigator.of(context).pop(); // Close the profile screen
  }

  // Function to contact support
  void contactSupport(BuildContext context) {
    // Implement your contact support logic here
    // You can open a contact form, chat, or any other support channel.
    // Replace the following line with your actual contact support logic.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Contacting support...'), // Placeholder message
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: const Color(0xFF2980B9),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileInfoContainer(
              storeName: storeName,
              address: address,
              taxInformation: taxInformation,
            ),
            SizedBox(height: 20),
            ElevatedButton(
  onPressed: () {
    // Navigate to the LoginPage when the "Logout" button is pressed
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  },
  child: Text('Logout'),
),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => contactSupport(context),
              child: Text('Contact Support'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileInfoContainer extends StatelessWidget {
  final String storeName;
  final String address;
  final String taxInformation;

  const ProfileInfoContainer({
    required this.storeName,
    required this.address,
    required this.taxInformation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Icon(
              Icons.store,
              color: Colors.blue,
              size: 36,
            ),
            title: Text(
              'Store Name:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(storeName, style: TextStyle(fontSize: 16)),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.location_on,
              color: Colors.green,
              size: 36,
            ),
            title: Text(
              'Address:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(address, style: TextStyle(fontSize: 16)),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.money,
              color: Colors.orange,
              size: 36,
            ),
            title: Text(
              'Tax Information:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(taxInformation, style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
