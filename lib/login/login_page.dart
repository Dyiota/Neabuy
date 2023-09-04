import 'package:flutter/material.dart';
import 'package:neabuy/business/business_registration_page.dart';
import 'package:neabuy/login/otp_screen.dart';
import 'dart:async'; // Import the 'dart:async' library

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController phoneNumberController = TextEditingController();
  bool showError = false; // Track if the error message should be shown

  void showErrorMessage() {
    setState(() {
      showError = true;
    });

    // Set a timer to hide the error message after 3 seconds
    Timer(Duration(seconds: 3), () {
      setState(() {
        showError = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFD3E3FC), // Light blue
              Color(0xFFF1F8FF), // Lighter blue
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/logo.png', // Replace with your app's logo image
                  width: 120.0,
                  height: 120.0,
                ),
                SizedBox(height: 20.0),
                Text(
                  'Welcome to MyApp', // Your app's name
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                Column(
                  children: [
                    TextField(
                      controller: phoneNumberController,
                      keyboardType: TextInputType.phone,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: 'Phone Number',
                        hintStyle: TextStyle(color: Colors.black.withOpacity(0.7)),
                        filled: true,
                        fillColor: Colors.black.withOpacity(0.2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    if (showError)
                      Text(
                        'Please enter your phone number.',
                        style: TextStyle(color: Colors.red),
                      ),
                  ],
                ),
                SizedBox(height: 10.0), // Increased spacing

                ElevatedButton(
                  onPressed: () {
                    final phoneNumber = phoneNumberController.text;
                    if (phoneNumber.isNotEmpty) {
                      // Navigate to the OTP screen with the entered phone number
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => OTPScreen(phoneNumber: phoneNumber, verificationId: '',),
                        ),
                      );
                    } else {
                      // Show an error message below the phone number field
                      showErrorMessage();
                    }
                  },
                  child: Text('Next'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF2980B9), // Dark blue
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                  ),
                ),

                SizedBox(height: 100.0), // Increased spacing

                Text(
                  'Looking to take your business online?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 10.0), // Increased spacing

                ElevatedButton(
                  onPressed: () {
                    // Navigate to the BusinessRegistrationPage when Register Business is pressed
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => BusinessRegistrationPage(),
                      ),
                    );
                  },
                  child: Text('Register as Business'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF2980B9), // Dark blue
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
