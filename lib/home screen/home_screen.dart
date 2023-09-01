import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:neabuy/map%20screen/map_screen.dart';

import 'package:neabuy/models/store.dart' as StoreModel;
import 'package:neabuy/stores%20page/stores_page.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  // ignore: unused_field
  late List<StoreModel.Store> _nearbyStores;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      MapScreen(
        store: StoreModel.Store(name: '', lat: 0, long: 0, starRating: 0, products: [], deliveryTime: 0),
        stores: const [],
      ),
      StoresPage(),
    ];
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      final userLat = position.latitude;
      final userLong = position.longitude;

      setState(() {
        _nearbyStores = calculateNearbyStores(userLat, userLong);
        _pages[1] = StoresPage();
      });
    } catch (e) {
      print('Error fetching location: $e');
    }
  }

  List<StoreModel.Store> calculateNearbyStores(double userLat, double userLong) {
    // Implement your logic to calculate nearby stores
    // ...

    return [];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Maps',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Stores',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
