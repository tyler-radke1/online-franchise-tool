import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'franchise_list.dart';

 class Franchise {
  final String id;
  final String name;

  Franchise({required this.id, required this.name});
}
// Settings Screen with Login/Logout and Franchise list
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
      List<Franchise> testFranchises = [
    Franchise(id: '1', name: 'Franchise A'),
    Franchise(id: '2', name: 'Franchise B'),
    Franchise(id: '3', name: 'Franchise C'),
  ];

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              // Simulate Login/Logout
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Login/Logout Button Pressed'),
              ));
            },
            child: const Text('Login/Logout'),
          ),
          const SizedBox(height: 20),
          const Text(
            'My Franchises',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8),
             children: <Widget>[
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}

