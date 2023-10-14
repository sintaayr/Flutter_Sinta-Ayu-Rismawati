import 'package:flutter/material.dart';

class ListTileDrawerWidget extends StatelessWidget {
  final String title;
  final Function() onTap;

  const ListTileDrawerWidget({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListTile(
        title: Text(title),
        onTap: onTap,
      ),
    );
  }
}
