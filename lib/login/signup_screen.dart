import 'package:flutter/material.dart';
import 'otp_screen.dart'; // Import your OTP screen

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String phoneNumber = '';
  String fullName = '';
  String email = '';
  bool showPhoneNumberEmptyError = false;
  bool showFullNameEmptyError = false;
  bool showEmailEmptyError = false;
  bool showInvalidEmailError = false;

  bool isEmailValid(String email) {
    // Use a regular expression to check for a valid email format
    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegExp.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: (value) {
                setState(() {
                  fullName = value;
                  showFullNameEmptyError = false;
                });
              },
              decoration: InputDecoration(
                hintText: 'Full Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                errorText: showFullNameEmptyError ? 'Please enter your full name' : null,
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  email = value;
                  showEmailEmptyError = false;
                  showInvalidEmailError = false;
                });
              },
              decoration: InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                errorText: showEmailEmptyError
                    ? 'Please enter your email'
                    : showInvalidEmailError
                        ? 'Please enter a valid email address'
                        : null,
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  phoneNumber = value;
                  showPhoneNumberEmptyError = false;
                });
              },
              decoration: InputDecoration(
                hintText: 'Phone Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                errorText: showPhoneNumberEmptyError ? 'Please enter your phone number' : null,
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                if (fullName.isEmpty || email.isEmpty || phoneNumber.isEmpty) {
                  setState(() {
                    showFullNameEmptyError = fullName.isEmpty;
                    showEmailEmptyError = email.isEmpty;
                    showPhoneNumberEmptyError = phoneNumber.isEmpty;
                  });
                } else if (!isEmailValid(email)) {
                  setState(() {
                    showInvalidEmailError = true;
                  });
                } else {
                  // Navigate to the OTP screen for phone number verification
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => OTPScreen(
                        phoneNumber: phoneNumber,
                      ),
                    ),
                  );
                }
              },
              child: Text('Verify Phone Number'),
            ),
          ],
        ),
      ),
    );
  }
}
