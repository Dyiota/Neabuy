import 'package:flutter/material.dart';

class InventoryManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory Management'),
        automaticallyImplyLeading: false, // Prevents the default back button
      ),
      body: Center(
        child: Text('Inventory management content goes here'),
      ),
    );
  }
}