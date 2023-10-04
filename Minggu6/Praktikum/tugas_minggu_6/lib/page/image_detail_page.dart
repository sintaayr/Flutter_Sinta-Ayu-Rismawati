import 'dart:io';

import 'package:flutter/material.dart';

class PageDetailImage extends StatelessWidget {
  const PageDetailImage({super.key});

  @override
  Widget build(BuildContext context) {
    final imageTerpilih = ModalRoute.of(context)!.settings.arguments as File;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Images"),
      ),
      body: Center(
        child: SizedBox(
          height: 300,
          width: 300,
          child: Image.file(
            imageTerpilih,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
