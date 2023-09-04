import 'package:flutter/material.dart';

class IncomingOrder {
  final String orderID;
  final List<String> items;
  bool isAccepted;
  bool isModified;
  bool isReadyForPickup;
  bool isPickedUp;
  bool isDelivered;

  IncomingOrder({
    required this.orderID,
    required this.items,
    this.isAccepted = false,
    this.isModified = false,
    this.isReadyForPickup = false,
    this.isPickedUp = false,
    this.isDelivered = false,
  });

  String getOrderStatus() {
    if (isDelivered) {
      return 'Delivered';
    } else if (isPickedUp) {
      return 'Picked Up';
    } else if (isReadyForPickup) {
      return 'Ready for Pickup';
    } else if (isModified) {
      return 'Modified';
    } else if (isAccepted) {
      return 'Accepted';
    } else {
      return 'Pending';
    }
  }
}

class IncomingOrdersManager {
  static List<IncomingOrder> incomingOrders = [
    IncomingOrder(orderID: '123456', items: ['Item 1', 'Item 2', 'Item 3']),
    IncomingOrder(orderID: '785012', items: ['Item 4', 'Item 5']),
    IncomingOrder(orderID: '799012', items: ['Item 4', 'Item 5']),
    IncomingOrder(orderID: '789412', items: ['Item 4', 'Item 5']),
    // Add more incoming orders here
  ];

  static void acceptOrder(BuildContext context, String orderID) {
    // Implement logic to accept the order here
    print('Accepted order: $orderID');

    // Show a confirmation dialog for order acceptance
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Order Accepted'),
          content: Text('Order $orderID has been accepted.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the confirmation dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static void showModifyDialog(BuildContext context, String orderID) {
    // TextEditingController for the modification reasons input
    TextEditingController modifyReasonsController = TextEditingController();

    // Show the modified reasons dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Modify Order'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Order ID: $orderID'),
                SizedBox(height: 10),
                Text(
                  'Modification Reasons:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: modifyReasonsController,
                  maxLines: 3, // Allow multiple lines for reasons
                  decoration: InputDecoration(
                    hintText: 'Enter modification reasons...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                // Implement logic to modify the order here
                String modificationReasons = modifyReasonsController.text;
                print('Modified order: $orderID with reasons: $modificationReasons');

                // Show a confirmation dialog for order modification
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Order Modified'),
                      content: Text(
                          'Order $orderID has been modified with reasons: $modificationReasons'),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the confirmation dialog
                            Navigator.of(context).pop(); // Close the "Modify Order" dialog
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Submit'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the "Modify Order" dialog
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  static void markAsReadyForPickup(BuildContext context, String orderID) {
    // Implement logic to mark the order as ready for pickup here
    print('Marked order as ready for pickup: $orderID');

    // Show a confirmation dialog for marking as ready for pickup
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Order Ready for Pickup'),
          content: Text('Order $orderID is now ready for pickup.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the confirmation dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static void markAsPickedUp(BuildContext context, String orderID) {
    // Implement logic to mark the order as picked up here
    print('Marked order as picked up: $orderID');

    // Show a confirmation dialog for marking as picked up
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Order Picked Up'),
          content: Text('Order $orderID has been picked up.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the confirmation dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static void markAsDelivered(BuildContext context, String orderID) {
    // Implement logic to mark the order as delivered here
    print('Marked order as delivered: $orderID');

    // Show a confirmation dialog for marking as delivered
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Order Delivered'),
          content: Text('Order $orderID has been delivered.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the confirmation dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}