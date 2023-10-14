import 'package:flutter/material.dart';

class HeaderContactPage extends StatelessWidget {
  const HeaderContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(
            'Contact Us',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 40,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        RichText(
          textAlign: TextAlign.justify,
          text: const TextSpan(
            text:
                'Need to get in touch with us? Either fill out the form with your inquiry or find the ',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
            children: [
              TextSpan(
                  text: 'department email',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  )),
              TextSpan(text: " you'd like to contact below.")
            ],
          ),
        ),
      ],
    );
  }
}
