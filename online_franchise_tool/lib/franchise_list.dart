import 'package:flutter/material.dart';


class Franchise {
  final String name;
  final String id;

  Franchise({required this.name, required this.id});
  static Map<String, String?> franchiseDirectories = {};
}

class FranchiseListItem extends StatefulWidget {
  const FranchiseListItem(Franchise franchise, {super.key});

  @override
  _FranchiseListItem createState() => _FranchiseListItem();
}

class _FranchiseListItem extends State<FranchiseListItem> {
  final Franchise franchise;

  _FranchiseListItem({required this.franchise});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(franchise.name), // Franchise name as the title
      trailing: ElevatedButton(
        onPressed: () {
          // Handle directory button press
          print('Directory button pressed for ${franchise.name}');
        },
        child: const Text('Directory'),
      ),
    );
  }
}

