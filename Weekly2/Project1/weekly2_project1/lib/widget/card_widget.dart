import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final IconData icons;
  final String title;
  final String description;

  const CardWidget(
      {super.key,
      required this.icons,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Colors.blueGrey,
        onTap: () {},
        child: SizedBox(
          width: 150,
          height: 200,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 8, right: 8, bottom: 8),
            child: Column(
              children: [
                Icon(icons),
                const SizedBox(height: 5),
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    description,
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
