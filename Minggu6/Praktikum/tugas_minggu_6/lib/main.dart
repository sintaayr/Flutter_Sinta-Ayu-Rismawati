import 'package:flutter/material.dart';
import 'package:tugas_minggu_6/page/gallery_page.dart';
import 'package:tugas_minggu_6/page/image_detail_page.dart';
import 'page/contact_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/':(context) => const ContactPage(),
        '/gallery':(context) => const GalleryPage(),
        '/detail_page':(context) => const PageDetailImage()
      },
      // home: const ContactPage(),
    );
  }
}
