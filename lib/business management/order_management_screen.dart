import 'package:flutter/material.dart';

class OrderManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Management'),
        automaticallyImplyLeading: false, // Prevents the default back button
      ),
      body: Center(
        child: Text('Order management content goes here'),
      ),
    );
  }
}