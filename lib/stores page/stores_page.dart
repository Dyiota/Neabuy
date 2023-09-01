import 'package:flutter/material.dart';
import 'package:neabuy/models/store.dart';
import 'package:neabuy/stores%20page/products_page.dart';

class StoresPage extends StatefulWidget {
  @override
  _StoresPageState createState() => _StoresPageState();
}

class _StoresPageState extends State<StoresPage> {
  final List<Store> stores = [
    Store( name: 'Store A', starRating: 4, lat: 37.7758, long: -122.4170, products: [ Product(name: 'Apple', price: 0.99, description: '250 gms fresh apples', weight: '', taxRate: 5), Product(name: 'Chicken', price: 0.49, description: '250 gms fresh apples', weight: '', taxRate: 5), ], deliveryTime: 30, ),
    Store( name: 'Store A', starRating: 4, lat: 37.7758, long: -122.4179, products: [ Product(name: 'Tomatto', price: 0.99, description: '250 gms fresh apples', weight: '', taxRate: 2), Product(name: 'Mutton', price: 0.49, description: '250 gms fresh apples', weight: '', taxRate: 2), ], deliveryTime: 30, ),
    Store( name: 'Store A', starRating: 4, lat: 37.7758, long: -122.4199, products: [ Product(name: 'Carrot', price: 0.99, description: '250 gms fresh apples', weight: '', taxRate: 12), Product(name: 'Orange', price: 0.49, description: '250 gms fresh apples', weight: '', taxRate: 5), ], deliveryTime: 30, ),
    Store( name: 'Store A', starRating: 4, lat: 37.7758, long: -122.4185, products: [ Product(name: 'Milk', price: 0.99, description: '250 gms fresh apples', weight: '', taxRate: 8), Product(name: 'Fish', price: 0.49, description: '250 gms fresh apples', weight: '', taxRate: 12), ], deliveryTime: 30, ),
    Store( name: 'Store A', starRating: 4, lat: 37.7758, long: -122.4189, products: [ Product(name: 'Beetrot', price: 0.99, description: '250 gms fresh apples', weight: '', taxRate: 12), Product(name: 'Orange', price: 0.49, description: '250 gms fresh apples', weight: '', taxRate: 10), ], deliveryTime: 30, ),
    Store( name: 'Store A', starRating: 4, lat: 37.7758, long: -122.4180, products: [ Product(name: 'Juice', price: 0.99, description: '250 gms fresh apples', weight: '', taxRate: 5), Product(name: 'Spinach', price: 0.49, description: '250 gms fresh apples', weight: '', taxRate: 12), ], deliveryTime: 30, ),

  ];

  List<Store> filteredStores = [];

  void _onStoreSelected(BuildContext context, int index) {
    final selectedStore = filteredStores[index];
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductsPage(store: selectedStore),
      ),
    );
  }

  void _filterStores(String query) {
    if (query.trim().length >= 2) {
      setState(() {
        filteredStores = stores.where((store) =>
            store.name.toLowerCase().contains(query.toLowerCase()) ||
            store.products
                .any((product) => product.name.toLowerCase().contains(query.toLowerCase())))
          .toList();
      });
    } else {
      setState(() {
        filteredStores.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: TextField(
                onChanged: _filterStores,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                  hintText: 'Search for stores or products',
                  hintStyle: TextStyle(color: Colors.grey[600]),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: filteredStores.isNotEmpty
                  ? GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                      ),
                      itemCount: filteredStores.length,
                      itemBuilder: (context, index) {
                        final store = filteredStores[index];
                        return GestureDetector(
                          onTap: () => _onStoreSelected(context, index),
                          child: _buildStoreCard(store),
                        );
                      },
                    )
                  : Center(
                      child: Text('No nearby stores found. Please search to find one.'),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStoreCard(Store store) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 4 / 3,
            child: Image.asset(
              'assets/store_image.png',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      store.name,
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${store.deliveryTime} mins',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4.0),
                Row(
                  children: List.generate(
                    5,
                    (index) => Icon(
                      Icons.star,
                      color: Colors.yellow[700],
                      size: 14.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
