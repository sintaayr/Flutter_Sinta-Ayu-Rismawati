import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/contact_model.dart';

class ButtonDeserialisasiWidget extends StatefulWidget {
  const ButtonDeserialisasiWidget({super.key});

  @override
  State<ButtonDeserialisasiWidget> createState() => _ButtonDeserialisasiWidgetState();
}

class _ButtonDeserialisasiWidgetState extends State<ButtonDeserialisasiWidget> {
  Dio dio = Dio();
  
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
              onPressed: () {
                // GET request and deserialization
                dio
                    .get(
                        'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/2')
                    .then((response) {
                  final jsonData = response.data;
                  final contact = Contact.fromJson(jsonData);
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Deserialisasi'),
                          content: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('id=${contact.id}'),
                                Text('name=${contact.name}'),
                                Text('phone=(${contact.phone})')
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'))
                          ],
                        );
                      });
                  // print(
                  //     'Deserialized Contact: id=${contact.id} name=${contact.name} phone=(${contact.phone})');
                });
              },
              child: const Text('Deserialisasi'),
            );
  }
}