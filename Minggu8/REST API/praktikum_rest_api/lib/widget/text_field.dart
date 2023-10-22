import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {

  const TextFieldWidget({super.key});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  String? label;

  TextEditingController? controller;

  String? hintText;

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        // label: 
      ),
    );
  }
}