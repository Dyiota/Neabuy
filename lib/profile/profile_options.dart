import 'package:flutter/material.dart';

class ProfileOption {
  final String title;
  final IconData icon;
  final Function() onPressed;

  ProfileOption({
    required this.title,
    required this.icon,
    required this.onPressed,
  });
}

class ProfileOptionRow extends StatelessWidget {
  final List<ProfileOption> options;

  ProfileOptionRow({required this.options});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 4,
            spreadRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: options.map((option) {
          return Column(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  option.icon,
                  size: 48.0,
                ),
                onPressed: option.onPressed,
              ),
              SizedBox(height: 8.0),
              Text(
                option.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
