import 'package:flutter/material.dart';
import 'package:neabuy/order%20tracking/track_order_status_page.dart';
import 'package:neabuy/stores%20page/cart/payment/payment_page.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.only(left: 16.0, right: 16.0, top: kToolbarHeight),
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  maxRadius: 48,
                  backgroundImage: AssetImage('assets/background.jpg'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Rose Helbert',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 4,
                        spreadRadius: 1,
                        offset: Offset(0, 1),
                      )
                    ],
                  ),
                  height: 150,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        buildProfileOption(
                          context,
                          'Shipped',
                          'assets/icons/truck.png',
                          () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => TrackOrderStatusPage(orderStatus: '', orderDescription: '',)),
                          ),
                        ),
                        buildProfileOption(
                          context,
                          'Payment',
                          'assets/icons/card.png',
                          () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => PaymentPage()),
                          ),
                        ),
                        buildProfileOption(
                          context,
                          'Support',
                          'assets/icons/contact_us.png',
                          () {},
                        ),
                      ],
                    ),
                  ),
                ),
                buildProfileListItem(
                  context,
                  'Settings',
                  'Privacy and logout',
                  'assets/icons/settings_icon.png',
                  () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => SettingsPage()),
                  ),
                ),
                Divider(),
                buildProfileListItem(
                  context,
                  'Help & Support',
                  'Help center and legal support',
                  'assets/icons/support.png',
                  () {},
                ),
                Divider(),
                buildProfileListItem(
                  context,
                  'FAQ',
                  'Questions and Answers',
                  'assets/icons/faq.png',
                  () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => FaqPage()),
                  ),
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildProfileOption(
    BuildContext context,
    String title,
    String iconPath,
    Function() onTap,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Image.asset(iconPath),
          onPressed: onTap,
        ),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Widget buildProfileListItem(
    BuildContext context,
    String title,
    String subtitle,
    String leadingIconPath,
    Function() onTap,
  ) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: Image.asset(
        leadingIconPath,
        fit: BoxFit.scaleDown,
        width: 30,
        height: 30,
      ),
      trailing: Icon(
        Icons.chevron_right,
        color: Colors.yellow, // Replace with your desired color
      ),
      onTap: onTap,
    );
  }
}

// Placeholder classes for the pages you're navigating to
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
class FaqPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
