import 'package:flutter/material.dart';
import 'package:neabuy/business/business%20verification/business_verification.dart';
import 'package:neabuy/business/business%20verification/verification_status_screen.dart';

class BusinessRegistrationPage extends StatefulWidget {
  @override
  _BusinessRegistrationPageState createState() =>
      _BusinessRegistrationPageState();
}

class _BusinessRegistrationPageState extends State<BusinessRegistrationPage> {
  bool isVerificationInProgress = false;

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
                // Start the verification process
                _startVerificationProcess();
              },
              child: isVerificationInProgress
                  ? CircularProgressIndicator()
                  : Text('Register Business'),
            ),
          ],
        ),
      ),
    );
  }

  void _startVerificationProcess() async {
    setState(() {
      isVerificationInProgress = true;
    });

    final businessVerification = BusinessVerification();
    final verificationResult = await businessVerification.verifyBusiness(
      // Pass the input data for verification
      businessName: 'Example Business',
      phoneNumber: '1234567890',
      emailAddress: 'example@example.com',
      location: 'Example Location',
    );

    setState(() {
      isVerificationInProgress = false;
    });

    if (verificationResult) {
      // Verification is successful, navigate to the status screen with "Approved" status
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => VerificationStatusScreen(status: 'Approved'),
        ),
      );
    } else {
      // Verification failed, navigate to the status screen with "Rejected" status
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => VerificationStatusScreen(status: 'Rejected'),
        ),
      );
    }
  }
}
