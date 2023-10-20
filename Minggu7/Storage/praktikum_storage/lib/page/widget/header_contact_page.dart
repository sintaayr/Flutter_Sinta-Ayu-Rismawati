import 'package:flutter/material.dart';

// import '../../theme/color_style.dart';
// import '../../theme/text_style.dart';


class HeaderContactPage extends StatelessWidget {
  const HeaderContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Icon(
              Icons.phone,
              // color: ThemeColor().m3SysLightPurpleSecondary,
            ),
          ),
          Text(
            "Create New Contacts",
            // style: ThemeTextStyle().m3HeadLineSmall,
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made. ",
              // style: ThemeTextStyle().m3BodyMedium,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Divider(
              // color: ThemeColor().m3SysLightPurple80,
            ),
          ),
        ],
      ),
    );
  }
}
