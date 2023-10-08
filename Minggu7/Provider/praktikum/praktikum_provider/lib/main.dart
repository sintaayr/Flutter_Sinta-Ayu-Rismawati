import 'package:flutter/material.dart';
import 'package:praktikum_provider/provider/contact_page_provider.dart';
import 'package:provider/provider.dart';
import 'page/contact_page.dart';
import 'page/gallery_page.dart';
import 'page/image_detail_page.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=> ContactPageProvider())
    ],
    child: const MyApp(),),

  );
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
