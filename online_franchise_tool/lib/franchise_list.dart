import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class Franchise {
  final String id;
  final String name;

  Franchise({required this.id, required this.name});
}

class FranchiseList extends StatefulWidget {
  final List<Franchise> franchises;

  const FranchiseList({Key? key, required this.franchises}) : super(key: key);

  @override
  _FranchiseListState createState() => _FranchiseListState();
}

class _FranchiseListState extends State<FranchiseList> {
  // Map to store franchise IDs and their corresponding directories
  Map<String, String> franchiseDirectories = {};

  Future<void> _saveFranchiseDirectory(String franchiseId) async {
    // Open the file picker to select a directory
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();

    if (selectedDirectory != null) {
      // Update the franchise directory in the map
      setState(() {
        franchiseDirectories[franchiseId] = selectedDirectory;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.franchises.length,
      itemBuilder: (context, index) {
        final franchise = widget.franchises[index];
        final directory = franchiseDirectories[franchise.id] ?? 'Directory not set';

        return ListTile(
          title: Text(franchise.name),
          subtitle: Text('Directory: $directory'),
          trailing: ElevatedButton(
            onPressed: () async {
              await _saveFranchiseDirectory(franchise.id);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${franchise.name} selected, directory updated'),
                ),
              );
            },
            child: const Text('Set Directory'),
          ),
        );
      },
    );
  }
}

class FranchiseListScreen extends StatelessWidget {
  // Sample data
  final List<Franchise> franchises = [
    Franchise(id: '1', name: 'Franchise A'),
    Franchise(id: '2', name: 'Franchise B'),
    Franchise(id: '3', name: 'Franchise C'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Franchise List'),
      ),
      body: FranchiseList(franchises: franchises),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: FranchiseListScreen(),
  ));
}
