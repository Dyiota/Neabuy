import 'package:flutter/material.dart';
import 'package:neabuy/order%20tracking/track_order_status_page.dart';
import 'package:neabuy/profile/profile_options.dart';
import 'package:neabuy/stores%20page/cart/payment/payment_page.dart';

class ProfileButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProfileOptionRow(
      options: [
        ProfileOption(
          title: 'Shipped',
          icon: Icons.local_shipping,
          onPressed: () {
            // Navigate to the Shipped/Tracking page
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => TrackOrderStatusPage(orderStatus: '', orderDescription: '',),
              ),
            );
          },
        ),
        ProfileOption(
          title: 'Payment',
          icon: Icons.payment,
          onPressed: () {
            // Navigate to the Payment page
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => PaymentPage(),
              ),
            );
          },
        ),
        ProfileOption(
          title: 'Support',
          icon: Icons.support,
          onPressed: () {
            // Implement your support functionality
          },
        ),
      ],
    );
  }
}
