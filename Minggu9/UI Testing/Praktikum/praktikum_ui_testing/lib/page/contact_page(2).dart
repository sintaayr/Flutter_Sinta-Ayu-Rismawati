import 'package:flutter/material.dart';

class ContactPage2 extends StatefulWidget {
  const ContactPage2({Key? key}) : super(key: key);

  @override
  State<ContactPage2> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage2> {
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
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
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
              key: const Key('RichText'),
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
              height: 40,
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
                        key: const Key('fisrtname'),
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
                        key: const Key('lastname'),
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
                  key: const Key('email'),
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
                  key: const Key('message'),
                  controller: messageController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Type here"),
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
                  key: const Key("submit"),
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
                            key: const Key('dialog'),
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
