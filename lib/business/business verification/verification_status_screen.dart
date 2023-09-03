// verification_status_screen.dart

import 'package:flutter/material.dart';
import 'package:neabuy/business/welcome_slide_screen.dart';

class VerificationStatusScreen extends StatelessWidget {
  final String status;

  VerificationStatusScreen({required this.status});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verification Status'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Verification Status:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              status,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
              SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the next screen (if applicable)
                // Replace the following line with your navigation logic
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => WelcomeSlideScreen(), // Replace with the next screen
                  ),
                );
              },
              child: Text('Next'), // Change the button text to "Next"
            ),
          ],
        ),
      ),
    );
  }
}
