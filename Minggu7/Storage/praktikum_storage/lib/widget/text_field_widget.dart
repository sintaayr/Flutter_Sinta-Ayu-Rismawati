import 'package:flutter/material.dart';

import '../theme/color_style.dart';
import '../theme/text_style.dart';

class TextFieldWidget extends StatefulWidget {
  final String label;
  final String hintText;
  final Function(String)? onChanged;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const TextFieldWidget({
    super.key,
    required this.label,
    required this.hintText,
    required this.onChanged,
    String? errorText,
    required this.controller, required this.keyboardType,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 7.5,
        top: 7.5,
        left: 16,
        right: 16,
      ),
      child: TextFormField(
        decoration: InputDecoration(
            filled: true,
            fillColor: ThemeColor().m3SysLightPurple70,
            labelStyle: ThemeTextStyle().m3BodySmall,
            hintStyle: ThemeTextStyle().m3BodyLarge,
            label: Text(
              widget.label,
            ),
            hintText: widget.hintText,
            floatingLabelBehavior: FloatingLabelBehavior.always),
        onChanged: widget.onChanged,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
      ),
    );
  }
}
