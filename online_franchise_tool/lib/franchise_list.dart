import 'package:flutter/material.dart';
import 'file_picker.dart';


class Franchise {
  final String name;
  final String id;

  Franchise({required this.name, required this.id});
  static Map<String, String?> franchiseDirectories = {};
}

class FranchiseListItem extends StatefulWidget {
  final Franchise franchise; 

  const FranchiseListItem({required this.franchise, Key? key}) : super(key: key);

  @override
  _FranchiseListItemState createState() => _FranchiseListItemState();
    
    
}

class _FranchiseListItemState extends State<FranchiseListItem> {

  void handleDirectory (String? directory,) {
    setState(() {
      Franchise.franchiseDirectories[widget.franchise.id] = directory;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.franchise.name), // Access the franchise via widget
      trailing: Row(
        mainAxisSize: MainAxisSize.min,  // Ensure the row takes only as much space as needed
        children: [
          Text(Franchise.franchiseDirectories[widget.franchise.id] ?? "No directory selected"), // Display file path or placeholder
          SizedBox(width: 8),  // Add some spacing between the text and button
          FilePickerButton(
            onDirectorySelected: (String? directory) {
              handleDirectory(directory);
            },
          ),
        ],
      ),
    );
  }
}
