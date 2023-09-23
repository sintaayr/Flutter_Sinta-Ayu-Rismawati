import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class FilePickerWidget extends StatefulWidget {
  final Function(FilePickerResult?) onFileSelected;
  const FilePickerWidget({super.key, required this.onFileSelected});

  @override
  State<FilePickerWidget> createState() => _FilePickerWidgetState();
}

class _FilePickerWidgetState extends State<FilePickerWidget> {
  FilePickerResult? result;
  FilePickerResult? result2;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 40,
        ),
        const Text("Pick Files"),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () async {
            _pickFile();
          },
          child: const Text("Pick and Open File"),
        )
      ],
    );
  }

  void _pickFile() async {
    FilePickerResult? resultFile = await FilePicker.platform.pickFiles();

    if (resultFile != null) {
      result = resultFile;
      _openFile(result!.files.first);
    }
    setState(() {});
    widget.onFileSelected(result);
  }

  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }
}
