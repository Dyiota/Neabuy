// track_order_status_page.dart
import 'package:flutter/material.dart';

class TrackOrderStatusPage extends StatelessWidget {
  final String orderStatus;
  final String orderDescription;

  TrackOrderStatusPage({
    required this.orderStatus,
    required this.orderDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Status'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              orderStatus,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              orderDescription,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the home screen (or any other screen) after reading the order status
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: Text('Back to Home'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                textStyle: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
