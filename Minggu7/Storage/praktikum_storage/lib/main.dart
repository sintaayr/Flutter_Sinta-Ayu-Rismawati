import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storage_prioritas_1_dan_2/page/splash_page.dart';
import 'package:storage_prioritas_1_dan_2/provider/contact_page_provider.dart';
import 'package:storage_prioritas_1_dan_2/provider/db_manager.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DbManager(),
        ),
        ChangeNotifierProvider(
          create: (_) => ContactPageProvider(),
        ),
      ],
      child: const MyApp(),
    ),
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
      home: const HalamanSplash(),
    );
  }
}
