import 'package:flutter/material.dart';
import 'prioritas1_1.dart';
// import 'form_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Prioritas1(),
      // home: prioritas2(),
    );
  }
}


