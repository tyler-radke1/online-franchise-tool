// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'settings.dart';
import 'file_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Franchise App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ), 
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    MainScreen(),
    const SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context); // Close the drawer when an item is selected
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Franchise App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Main Screen'),
              onTap: () => _onItemTapped(0),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () => _onItemTapped(1),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}

// Main Screen with Download and Upload buttons
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              // Simulate Download action
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Download Button Pressed'),
              ));
            },
            child: const Text('Download'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Simulate Upload action
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Upload Button Pressed'),
              ));
            },
            child: const Text('Upload'),
          ),
        ],
      ),
    );
  }
}