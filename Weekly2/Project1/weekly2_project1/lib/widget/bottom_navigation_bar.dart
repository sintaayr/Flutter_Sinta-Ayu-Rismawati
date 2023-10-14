import 'package:flutter/material.dart';

class BottomNavigtionBarWidget extends StatelessWidget {
  const BottomNavigtionBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.info_outline),
        label: 'Detail',
      ),
    ]);
  }
}
