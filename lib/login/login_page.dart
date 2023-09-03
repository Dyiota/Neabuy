import 'package:flutter/material.dart';
import 'package:neabuy/login/signup_screen.dart';
import 'otp_screen.dart'; // Import your OTP screen


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String phoneNumber = '';
  bool phoneNumberNotFound = false; // Track if phone number is not found
  bool showPhoneNumberEmptyError = false; // Track if phone number is empty

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use a LinearGradient for the background color
      backgroundColor: Colors.transparent,
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
                // App Logo or Icon
                Container(
                  width: 120.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    // You can use your app's logo image here
                  ),
                  // Replace with your logo image
                  child: Icon(
                    Icons.lock,
                    size: 60.0,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Welcome to MyApp', // Your app's name
                  style: TextStyle(
                    color: Colors.black, // Use black or a dark color for text on light background
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                // Replace the password input field with phone number input field
                TextField(
                  onChanged: (value) {
                    setState(() {
                      phoneNumber = value;
                      phoneNumberNotFound = false; // Reset the error message when the user types
                      showPhoneNumberEmptyError = false; // Reset the empty field error message
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8), // Slightly transparent white
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    // Show error message if phone number is not found
                    errorText: phoneNumberNotFound ? 'Account not found, please sign up' : null,
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    if (phoneNumber.isEmpty) {
                      // Show the empty field error message
                      setState(() {
                        showPhoneNumberEmptyError = true;
                        phoneNumberNotFound = false; // Reset the not found error message
                      });
                    } else {
                      // Simulate checking if phone number exists (replace with your Firebase logic)
                      final phoneExists = false; // Replace with your Firebase logic
                      // ignore: dead_code
                      if (phoneExists) {
                        // Navigate to the OTP screen when the "Login" button is pressed
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => OTPScreen(
                              phoneNumber: phoneNumber,
                            ),
                          ),
                        );
                      } else {
                        // Set the phone number not found flag to show error message
                        setState(() {
                          phoneNumberNotFound = true;
                          showPhoneNumberEmptyError = false; // Reset the empty field error message
                        });
                      }
                    }
                  },
                  child: Text('Login'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                  ),
                ),
                if (showPhoneNumberEmptyError)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Please enter a registered Phone number',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                SizedBox(height: 20.0),
                Text(
                  'Don\'t have an account?',
                  style: TextStyle(color: Colors.black), // Use black for text on light background
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to the SignupPage when the "Sign Up" button is pressed
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => SignupPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.blue, // Use an accent color for the button
                      fontWeight: FontWeight.bold,
                    ),
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
