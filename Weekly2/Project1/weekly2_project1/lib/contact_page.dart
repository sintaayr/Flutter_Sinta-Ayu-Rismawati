import 'package:flutter/material.dart';
import 'package:weekly2_project1/widget/card_widget.dart';
import 'package:weekly2_project1/widget/form_contact_page.dart';
import 'package:weekly2_project1/widget/header_contact_page.dart';

import 'widget/bottom_navigation_bar.dart';
import 'widget/list_tile_drawer_widget.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weekly 2",
          style: TextStyle(color: Color.fromARGB(221, 255, 255, 255)),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 30,
          left: 20,
          right: 20,
        ),
        child: ListView(
          children: [
            const HeaderContactPage(),
            const SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 150,
                  child: TextFieldWidget(
                    controller: firstNameController,
                    title: "First Name",
                    hintText: "Input first name",
                    inputType: TextInputType.text,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 150,
                  child: TextFieldWidget(
                      controller: lastNameController,
                      title: "Last name",
                      hintText: "Input last name",
                      inputType: TextInputType.text),
                )
              ],
            ),
            const SizedBox(height: 20),
            TextFieldWidget(
              controller: emailController,
              title: "Email*",
              hintText: "Input email",
              inputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            TextFieldWidget(
              controller: messageController,
              title: "What can we help you with?",
              hintText: "Type here...",
              inputType: TextInputType.multiline,
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
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
            ),
            const SizedBox(height: 20),
            const Column(
              children: [
                Text(
                  "About Us",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Code Competence Weekly 2",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    CardWidget(
                      icons: (Icons.ac_unit),
                      title: "Project 1",
                      description:
                          "Buatlah button untuk menampilkan sidebar dimana terdapat 3 menu yaitu : Contact Us, About Us, Login",
                    ),
                    SizedBox(width: 2),
                    CardWidget(
                      icons: (Icons.adb_outlined),
                      title: "Project 2",
                      description:
                          "Commit project ke dalam GitHub. Lakukan build aplikasi project tersebut dan pasang pada hp kalian.",
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigtionBarWidget(),
      drawer: Drawer(
        child: ListView(
          children: [
            const SizedBox(
              height: 70,
              child: DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Center(
                  child: Text(
                    "Menu",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            ListTileDrawerWidget(
              title: "Contact Us",
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTileDrawerWidget(
              title: "About Us",
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTileDrawerWidget(
              title: "Login",
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
