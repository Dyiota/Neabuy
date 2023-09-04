import 'package:flutter/material.dart';
import 'package:neabuy/business%20management/order%20management/incoming_orders.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Order Management App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OrderManagementScreen(),
    );
  }
}

class OrderManagementScreen extends StatefulWidget {
  @override
  _OrderManagementScreenState createState() => _OrderManagementScreenState();
}

class _OrderManagementScreenState extends State<OrderManagementScreen> {
  int ordersDeliveredCount = 0;
  int ordersReturnedCount = 0;
  double totalSales = 0.0;
  double storeRating = 4.5; // Initial store rating (you can set it to any default value)

  void updateOrderStatus(String orderID, bool isAccepted, bool isModified, bool isReadyForPickup, bool isPickedUp, bool isDelivered) {
    setState(() {
      final orderIndex = IncomingOrdersManager.incomingOrders.indexWhere((order) => order.orderID == orderID);
      if (orderIndex != -1) {
        IncomingOrdersManager.incomingOrders[orderIndex].isAccepted = isAccepted;
        IncomingOrdersManager.incomingOrders[orderIndex].isModified = isModified;
        IncomingOrdersManager.incomingOrders[orderIndex].isReadyForPickup = isReadyForPickup;
        IncomingOrdersManager.incomingOrders[orderIndex].isPickedUp = isPickedUp;
        IncomingOrdersManager.incomingOrders[orderIndex].isDelivered = isDelivered;

        if (isDelivered) {
          ordersDeliveredCount++;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Order Management',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        // Ratings section below the app bar
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0), // Adjust the height as needed
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Store Rating: ',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Text(
                  storeRating.toStringAsFixed(1),
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Your Sale Summary ',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
           SizedBox(height: 20),
Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 3,
        blurRadius: 7,
        offset: Offset(0, 3),
      ),
    ],
  ),
  padding: EdgeInsets.all(16),
  child: Row( // Use Row instead of Column to arrange items horizontally
    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Adjust alignment as needed
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Orders Delivered',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            '$ordersDeliveredCount',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Orders Returned',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            '$ordersReturnedCount',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total Sales (Today)',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            '\$${totalSales.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ],
  ),
),

            SizedBox(height: 20),
            Text(
              'Incoming Orders',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: IncomingOrdersManager.incomingOrders.length,
                itemBuilder: (context, index) {
                  final orderData = IncomingOrdersManager.incomingOrders[index];
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      title: Text(
                        'Order ID: ${orderData.orderID}',
                        style: TextStyle(fontSize: 16),
                      ),
                      subtitle: Text('Status: ${orderData.getOrderStatus()}'),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Order Details'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Order ID: ${orderData.orderID}'),
                                    SizedBox(height: 10),
                                    Text(
                                      'Items:',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    ...orderData.items.map((item) {
                                      return Text(item);
                                    }).toList(),
                                    SizedBox(height: 20),
                                    if (!orderData.isAccepted)
                                      buildStatusButton(
                                        text: 'Accept',
                                        color: Colors.green,
                                        onPressed: () {
                                          IncomingOrdersManager.acceptOrder(context, orderData.orderID);
                                          updateOrderStatus(orderData.orderID, true, false, false, false, false);
                                        },
                                      ),
                                    if (!orderData.isModified)
                                      buildStatusButton(
                                        text: 'Modify',
                                        color: Colors.orange,
                                        onPressed: () {
                                          IncomingOrdersManager.showModifyDialog(context, orderData.orderID);
                                          updateOrderStatus(orderData.orderID, false, true, false, false, false);
                                        },
                                      ),
                                    if (!orderData.isReadyForPickup)
                                      buildStatusButton(
                                        text: 'Ready for Pickup',
                                        color: Colors.blue,
                                        onPressed: () {
                                          IncomingOrdersManager.markAsReadyForPickup(context, orderData.orderID);
                                          updateOrderStatus(orderData.orderID, false, false, true, false, false);
                                        },
                                      ),
                                    if (!orderData.isPickedUp)
                                      buildStatusButton(
                                        text: 'Picked Up',
                                        color: Colors.purple,
                                        onPressed: () {
                                          IncomingOrdersManager.markAsPickedUp(context, orderData.orderID);
                                          updateOrderStatus(orderData.orderID, false, false, false, true, false);
                                        },
                                      ),
                                    if (!orderData.isDelivered)
                                      buildStatusButton(
                                        text: 'Delivered',
                                        color: Colors.red,
                                        onPressed: () {
                                          IncomingOrdersManager.markAsDelivered(context, orderData.orderID);
                                          updateOrderStatus(orderData.orderID, false, false, false, false, true);
                                        },
                                      ),
                                  ],
                                ),
                              ),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Close'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStatusButton({
    required String text,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: color,
        ),
        child: Text(text),
      ),
    );
  }
}