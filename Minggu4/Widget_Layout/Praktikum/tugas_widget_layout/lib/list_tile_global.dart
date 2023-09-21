// Prioritas 1 no.2

import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  final String textAvatar;
  final String textTitle;
  final String textSubtitle;

  const ListTileWidget(
      {super.key,
      required this.textAvatar,
      required this.textTitle,
      required this.textSubtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: const Color.fromARGB(202, 94, 207, 100),
        child: Text(
          textAvatar,
          style: const TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      title: Text(
        textTitle,
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        textSubtitle,
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
