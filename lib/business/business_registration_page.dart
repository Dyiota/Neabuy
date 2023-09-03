// business_registration.dart

import 'package:flutter/material.dart';

class BusinessRegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Business Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Business Name:',
              style: TextStyle(fontSize: 18),
            ),
            TextFormField(
              // Add text input for business name
            ),
            SizedBox(height: 20.0),
            Text(
              'Phone Number:',
              style: TextStyle(fontSize: 18),
            ),
            TextFormField(
              // Add text input for phone number
            ),
            SizedBox(height: 20.0),
            Text(
              'Email Address:',
              style: TextStyle(fontSize: 18),
            ),
            TextFormField(
              // Add text input for email address
            ),
            SizedBox(height: 20.0),
            Text(
              'Location:',
              style: TextStyle(fontSize: 18),
            ),
            TextFormField(
              // Add text input for location
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Add logic to handle business registration here
              },
              child: Text('Register Business'),
            ),
          ],
        ),
      ),
    );
  }
}
