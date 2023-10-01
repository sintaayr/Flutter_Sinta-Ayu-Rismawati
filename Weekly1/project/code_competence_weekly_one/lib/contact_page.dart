import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Code Competence Weekly 1',
            style: TextStyle(color: Color.fromARGB(221, 255, 255, 255)),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: ListView(
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
              height: 40,
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
            const SizedBox(
              height: 80,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('First name*'),
                    SizedBox(
                      width: 150,
                      child: TextField(
                        controller: firstNameController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Input first name'),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Last name'),
                    SizedBox(
                      width: 150,
                      child: TextField(
                        controller: lastNameController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Input last name'),
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Email*'),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Input email'),
                  keyboardType: TextInputType.emailAddress,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('What can we help you with?'),
                TextField(
                  controller: messageController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            contentPadding: const EdgeInsets.all(20.0),
                            title: const Text('Contact Information'),
                            content: IntrinsicHeight(
                              child: IntrinsicWidth(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        'First Name : ${firstNameController.text}'),
                                    Text(
                                        'Last name : ${lastNameController.text}'),
                                    Text('Email : ${emailController.text}'),
                                    Text('Message : ${messageController.text}')
                                  ],
                                ),
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Close'),
                              ),
                            ],
                          );
                        });
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
