import 'package:flutter/material.dart';

import '../theme/color_style.dart';
import '../theme/text_style.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  const ButtonWidget({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ThemeColor().m3SysLightPurple,
              ),
              onPressed: onPressed,
              child: Text(
                title,
                style: ThemeTextStyle().m3LabelLarge,
              )),
        ],
      ),
    );
  }
}
