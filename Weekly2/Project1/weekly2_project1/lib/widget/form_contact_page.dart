import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String title;
  final String hintText;
  final TextInputType inputType;
  final int? maxLines;

  const TextFieldWidget(
      {super.key,
      required this.controller,
      required this.title,
      required this.hintText,
      required this.inputType,this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: hintText,
              ),
              keyboardType: inputType,
              maxLines: maxLines,
            )
          ],
        ),
      ],
    );
  }
}
