// order_routing_screen.dart
import 'package:flutter/material.dart';

class OrderRoutingScreen extends StatelessWidget {
  final String orderId; // Unique identifier for the order

  OrderRoutingScreen({required this.orderId});

  @override
  Widget build(BuildContext context) {
    // You can display order details and route it to the stores here
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Routing'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Order ID: $orderId',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Order is being routed to the stores.',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
