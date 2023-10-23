import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ButtonPutWidget extends StatefulWidget {
  const ButtonPutWidget({Key? key}) : super(key: key);

  @override
  State<ButtonPutWidget> createState() => _ButtonPutWidgetState();
}

class _ButtonPutWidgetState extends State<ButtonPutWidget> {
  Dio dio = Dio();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // PUT request
        final data = {
          'id': 1,
          'title': 'foo',
          'body': 'bar',
          'userId': 1,
        };
        dio.put('https://jsonplaceholder.typicode.com/posts/1', data: data).then((response) {
          if (response.statusCode == 200) {
            // Permintaan PUT berhasil, tampilkan dialog
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('PUT Data Berhasil'),
                  content: const Text('Data berhasil diperbarui.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
          } else {
            // Permintaan PUT gagal, tampilkan pesan kesalahan jika diperlukan
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Gagal'),
                  content: Text('Gagal memperbarui data. Status code: ${response.statusCode}'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
          }
        });
      },
      child: const Text('PUT'),
    );
  }
}
