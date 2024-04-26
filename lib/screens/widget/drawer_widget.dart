import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          Container(
            color: Color(0xffe3d600),
            height: 100,
            child: DrawerHeader(
              decoration: BoxDecoration(),
              child: Row(
                children: [
                  Image.asset("assets/logo.png"),
                  const SizedBox(
                    width: 10,
                  ),
                  Text('3123421'),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.blueAccent,
            ),
            title: const Text('Home 1'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(),
          ),
          ListTile(
            leading: Icon(
              Icons.lock_clock,
              color: Colors.blueAccent,
            ),
            title: const Text('Purchased Digital Goods'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(),
          ),
          ListTile(
            leading: Icon(
              Icons.info,
              color: Colors.blueAccent,
            ),
            title: const Text('Imtiyaz'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.blueAccent,
            ),
            title: const Text('Settings'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(),
          ),
          ListTile(
            leading: Icon(
              Icons.notifications,
              color: Colors.blueAccent,
            ),
            title: const Text('Notification History'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(),
          ),
          ListTile(
            leading: Icon(
              Icons.document_scanner,
              color: Colors.blueAccent,
            ),
            title: const Text('Missing Documents'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(),
          ),
          ListTile(
            leading: Icon(
              Icons.payment,
              color: Colors.blueAccent,
            ),
            title: const Text('Buy Walletcard'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(),
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Colors.blueAccent,
            ),
            title: const Text('Logout'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(),
          ),
        ],
      ),
    );
  }
}
