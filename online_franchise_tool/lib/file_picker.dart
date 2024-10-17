import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'File Picker Example',
      home: FilePickerScreen(),
    );
  }
}

class FilePickerScreen extends StatelessWidget {
  const FilePickerScreen({super.key});

  Future<void> _openFileManager(BuildContext context) async {
    // Open the file picker to select a directory
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();

    // If a directory is selected, show it in a dialog
    if (selectedDirectory != null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Selected Directory'),
          content: Text(selectedDirectory),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File Picker'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _openFileManager(context),
          child: const Text('Open File Manager'),
        ),
      ),
    );
  }
}
