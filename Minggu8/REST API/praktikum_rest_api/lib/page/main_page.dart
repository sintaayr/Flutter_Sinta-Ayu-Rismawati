import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:praktikum_rest_api/widget/button_deserialisasi.dart';
import 'package:praktikum_rest_api/widget/button_post.dart';
import 'package:praktikum_rest_api/widget/button_put.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainAppState();
}

class _MainAppState extends State<MainPage> {
  Dio dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TASK REST API'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonPostWidget(),
            ButtonDeserialisasiWidget(),
            ButtonPutWidget()           
          ],
        ),
      ),
    );
  }
}
