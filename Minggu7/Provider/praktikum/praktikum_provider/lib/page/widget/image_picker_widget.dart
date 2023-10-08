import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  final Function(XFile?) onImageSelected;
  const ImagePickerWidget({super.key, required this.onImageSelected});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  XFile? file;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Pilih Gambar"),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {
            _pickImage(source: ImageSource.gallery);
          },
          child: const Text("Choose from gallery"),
        ),
      ],
    );
  }

  void _pickImage({required ImageSource source}) async {
    final result = await ImagePicker().pickImage(source: source);

    if (result != null) {
      file = result;
      // print(result.path);
      setState(() {});
      widget.onImageSelected(file);
    }
  }
}
