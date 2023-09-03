import 'package:flutter/material.dart';
import 'package:neabuy/login/welcome/introduction_screen.dart';

// ignore: must_be_immutable
class AddressScreen extends StatelessWidget {
  String address = '';
  String fullName = '';
  String email = '';

  AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Address, Name, and Email'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: (value) {
                address = value;
              },
              decoration: InputDecoration(
                hintText: 'Address',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              onChanged: (value) {
                fullName = value;
              },
              decoration: InputDecoration(
                hintText: 'Full Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              onChanged: (value) {
                email = value;
              },
              decoration: InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Implement your logic for handling address, name, and email input here
                // For example, you can print the user's details to the console
                print('Address: $address');
                print('Full Name: $fullName');
                print('Email: $email');

                // After successfully entering details, navigate to the welcome screen
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => IntroductionScreens(),
                  ),
                );
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
