import 'package:flutter/material.dart';
import 'package:praktikum_mvvp/screen/contact_view_model.dart';
import 'package:provider/provider.dart';
import 'screen/contact_view.dart';

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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ContactPage(),
    );
  }
}
