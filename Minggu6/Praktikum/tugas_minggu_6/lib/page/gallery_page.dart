import 'package:flutter/material.dart';
import 'dart:io';

class GalleryPage extends StatelessWidget {

  const GalleryPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final imageItems = ModalRoute.of(context)!.settings.arguments as List;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gallery"),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: imageItems.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                )),
                context: context,
                builder: (context) => Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: Container(
                              padding: const EdgeInsets.all(8),
                              child: Image.file(
                                File(imageItems[index].imagePath),
                                fit: BoxFit.contain,
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                    '/detail_page', arguments:  File(imageItems[index].imagePath),
                                  );
                                },
                                child: const Text("YES"),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("NO"),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Image.file(
                        File(imageItems[index].imagePath),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              );
            },
            child: Image.file(
              File(imageItems[index].imagePath),
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
