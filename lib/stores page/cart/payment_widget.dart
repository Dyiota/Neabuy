import 'package:flutter/material.dart';

class PaymentWidget extends StatelessWidget {
  final Function() onPayNowPressed; // Callback for "Pay Now" button
  final Function() onPayOnDeliveryPressed; // Callback for "Pay on Delivery" button

  PaymentWidget({required this.onPayNowPressed, required this.onPayOnDeliveryPressed, required Null Function() onPayLaterPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Payment Information',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20), // Add some spacing
        ElevatedButton(
          onPressed: onPayNowPressed,
          child: Text('Pay Now'),
        ),
        SizedBox(height: 10), // Add some spacing
        ElevatedButton(
          onPressed: onPayOnDeliveryPressed,
          child: Text('Pay on Delivery'),
        ),
      ],
    );
  }
}
