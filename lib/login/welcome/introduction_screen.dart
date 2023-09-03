import 'package:flutter/material.dart';
import 'package:neabuy/home%20screen/home_screen.dart';

class IntroductionScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Introduction Screens'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to NeaBuy App!'),
            // Add your introduction screen content here
            // You can use PageView or any other widgets to create multiple screens
            // that explain your app.
            ElevatedButton(
              onPressed: () {
                // Navigate to the home page or any other desired screen
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => MyHomePage(),
                  ),
                );
              },
              child: Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
