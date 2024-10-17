import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FilePickerButton extends StatelessWidget {
  final Function(String?) onDirectorySelected;

  const FilePickerButton({Key? key, required this.onDirectorySelected}) : super(key: key);

  Future<void> _openFileManager(BuildContext context) async {
    // Open the file picker to select a directory
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();

    // Invoke the callback function with the selected directory
    onDirectorySelected(selectedDirectory);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _openFileManager(context),
      child: const Text('Open File Manager'),
    );
  }
}


