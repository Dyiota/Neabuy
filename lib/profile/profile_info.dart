import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfileInfoSection extends StatefulWidget {
  @override
  _ProfileInfoSectionState createState() => _ProfileInfoSectionState();
}

class _ProfileInfoSectionState extends State<ProfileInfoSection> {
  String name = '';
  String phoneNumber = '';
  String location = '';

  @override
  void initState() {
    super.initState();
    // Fetch user data when the widget is initialized
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      final response = await http.get(Uri.parse('YOUR_API_ENDPOINT/user'), headers: {
        'Authorization': 'Bearer YOUR_AUTH_TOKEN', // Replace with your auth token
      });

      if (response.statusCode == 200) {
        final userData = json.decode(response.body);
        setState(() {
          name = userData['user']['name'];
          phoneNumber = userData['user']['phone_number'];
          location = userData['user']['location'];
        });
      } else {
        // Handle error here (e.g., show an error message)
        print('Failed to fetch user data: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network or other exceptions here
      print('Error fetching user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Name',
                icon: Icon(Icons.person),
              ),
              controller: TextEditingController(text: name),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                hintText: 'Phone Number',
                icon: Icon(Icons.phone),
              ),
              controller: TextEditingController(text: phoneNumber),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                hintText: 'Location',
                icon: Icon(Icons.location_on),
              ),
              controller: TextEditingController(text: location),
            ),
          ],
        ),
      ),
    );
  }
}
