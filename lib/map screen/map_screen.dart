  import 'package:flutter/material.dart';
  import 'package:google_maps_flutter/google_maps_flutter.dart';
  import 'package:location/location.dart';
  import 'package:neabuy/models/store.dart'; // Update the import path for the Store class

  class MapScreen extends StatefulWidget {
    final Store store;
    final List<Store> stores;

    MapScreen({required this.store, required this.stores});

    @override
    _MapScreenState createState() => _MapScreenState();
  }

  class _MapScreenState extends State<MapScreen> {
    GoogleMapController? _mapController;
    Location _location = Location();
    LatLng _currentLatLng = LatLng(37.7749, -122.4194);
    Set<Marker> _storeMarkers = {};

    @override
    void initState() {
      super.initState();
      _location.getLocation().then((locationData) {
        setState(() {
          _currentLatLng = LatLng(locationData.latitude!, locationData.longitude!);
          _storeMarkers = _createStoreMarkers();
        });
      });
    }

    Set<Marker> _createStoreMarkers() {
      final userMarker = Marker(
        markerId: MarkerId('user_location'),
        position: _currentLatLng,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        infoWindow: InfoWindow(title: 'Your Location'),
      );

      final storeMarkers = widget.stores.map((store) {
        return Marker(
          markerId: MarkerId(store.name),
          position: LatLng(store.lat, store.long),
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(title: store.name),
        );
      }).toSet();

      storeMarkers.add(userMarker);

      return storeMarkers;
    }

    void _onMapCreated(GoogleMapController controller) {
      _mapController = controller;
    }

    void _goToCurrentLocation() {
      _mapController?.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: _currentLatLng,
          zoom: 15.0,
        ),
      ));
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _currentLatLng,
                zoom: 12.0,
              ),
              markers: _storeMarkers,
            ),
            Positioned(
              bottom: 120.0,
              right: 10.0,
              child: InkWell(
                onTap: _goToCurrentLocation,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.location_searching,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
      
    }
  }
