import 'package:flutter/material.dart';
import '../theme/theme_color_style.dart';
import '../theme/theme_text_style.dart';

class TextFieldWidget extends StatelessWidget {
  final String label;
  final String hintText;
  final Function(String)? onChanged;
  final TextEditingController controller;
  final TextInputType keyboardType;
  // final String? Function(String?)? validator;

  const TextFieldWidget({
    super.key,
    required this.label,
    required this.hintText,
    required this.onChanged,
    String? errorText,
    required this.controller, required this.keyboardType,
    

    // required this.validator,
  });

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
              label,
            ),
            hintText: hintText,
            floatingLabelBehavior: FloatingLabelBehavior.always),
        onChanged: onChanged,
        controller: controller,
        keyboardType: keyboardType,
        // validator: validator,
      ),
    );
  }
}
