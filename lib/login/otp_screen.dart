import 'package:flutter/material.dart';
import 'package:neabuy/login/Address_screen.dart';

class OTPScreen extends StatelessWidget {
  final String phoneNumber; // Passed from LoginPage

  OTPScreen({required this.phoneNumber, required String verificationId});

  // Placeholder OTP verification logic
  Future<bool> _verifyOTP(String enteredOTP) async {
    // Simulate OTP verification for testing purposes.
    await Future.delayed(Duration(seconds: 2));
    return enteredOTP == '123456'; // Replace '123456' with the expected OTP.
  }

  void _onOtpVerified(BuildContext context, String enteredOTP) async {
    try {
      final isOtpVerified = await _verifyOTP(enteredOTP);

      if (isOtpVerified) {
        // Navigate to the AddressScreen after OTP verification
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => AddressScreen(),
          ),
        );
      } else {
        // Handle OTP verification failure here, if needed.
        // You can show an error message to the user.
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('OTP verification failed. Please try again.'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (error) {
      // Handle any errors that occur during OTP verification.
      // You can show an error message to the user.
      print('Error during OTP verification: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use a LinearGradient for the background color
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
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
                SizedBox(height: 20.0),
                Text(
                  'Enter OTP sent to $phoneNumber',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'OTP',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8), // Slightly transparent white
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {
                    final enteredOTP = '123456'; // Placeholder OTP, replace with user's input
                    _onOtpVerified(context, enteredOTP);
                  },
                  child: Text('Verify OTP'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
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
