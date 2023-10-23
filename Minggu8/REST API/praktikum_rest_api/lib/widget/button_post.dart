import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ButtonPostWidget extends StatefulWidget {
  const ButtonPostWidget({super.key});

  @override
  State<ButtonPostWidget> createState() => _ButtonPostWidgetState();
}

class _ButtonPostWidgetState extends State<ButtonPostWidget> {
  Dio dio = Dio();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
              onPressed: () {
                final data = {'name': 'Sinta', 'email': 'sintaayr03@gmail.com'};
                dio
                    .post(
                  'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts',
                  data: data,
                )
                    .then((response) {
                  if (response.statusCode == 201) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('POST Data Berhasil'),
                          content: const Text('Data telah berhasil dipost.'),
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
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Gagal'),
                          content: Text(
                              'Gagal mempost data. Status code: ${response.statusCode}'),
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
              child: const Text('POST'),
            );
  }
}