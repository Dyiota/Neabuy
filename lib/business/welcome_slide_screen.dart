import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:neabuy/business/business%20main%20page/business_main_page.dart';

class WelcomeSlideScreen extends StatefulWidget {
  @override
  _WelcomeSlideScreenState createState() => _WelcomeSlideScreenState();
}

class _WelcomeSlideScreenState extends State<WelcomeSlideScreen> {
  final List<String> slideContents = [
    'Slide 1\n\nLorem ipsum dolor sit amet...',
    'Slide 2\n\nLorem ipsum dolor sit amet...',
    'Slide 3\n\nLorem ipsum dolor sit amet...',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Neabuy'),
      ),
      body: Center(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CarouselSlider(
                  items: slideContents.map((content) {
                    return Container(
                      color: Colors.blue, // Set background color or add an image
                      child: Center(
                        child: Text(
                          content,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    autoPlay: false, // Set to true for automatic slide animation
                    aspectRatio: 16 / 9,
                    enlargeCenterPage: true,
                  ),
                ),
                SizedBox(height: 20.0), // Adjust spacing
              ],
            ),
            Positioned(
              bottom: 20.0,
              right: 20.0,
              child: ElevatedButton(
                onPressed: () {
                  // Handle the "Skip" action
                  _skipSlides();
                },
                child: Text('Skip'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _skipSlides() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => BusinessMainPage(),
      ),
    );
  }
}
