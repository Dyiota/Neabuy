import 'package:flutter/material.dart';
import 'package:neabuy/login/login_page.dart';


void main() => runApp(NeaBuyApp());

class NeaBuyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neabuy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
