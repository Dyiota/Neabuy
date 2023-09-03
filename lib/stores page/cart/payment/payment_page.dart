// payment_page.dart
import 'package:flutter/material.dart';
import 'package:neabuy/order%20routing/order_routing_screen.dart';
import 'package:neabuy/order%20tracking/track_order_status_page.dart';

class PaymentPage extends StatelessWidget {
  // Simulated variable to track whether stores accepted the order
  bool storesAcceptedOrder = false;

  PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Payment Page',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Payment processing goes here.',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Simulate the scenario where the stores accepted the order
                storesAcceptedOrder = true;

                // Route the order to the stores
                final orderId = '123456'; // Replace with the actual order ID
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => OrderRoutingScreen(orderId: orderId),
                  ),
                );
              },
              child: Text('Route Order to Stores'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                textStyle: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Simulate the scenario where the stores did not accept the order on time
                if (!storesAcceptedOrder) {
                  // Navigate to the TrackOrderStatusPage with canceled status and description
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => TrackOrderStatusPage(
                        orderStatus: 'Order Canceled',
                        orderDescription: 'The store did not accept the order. A refund has been issued.',
                      ),
                    ),
                  );
                }
              },
              child: Text('Check Order Status'),
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
