import 'package:flutter/material.dart';
import 'package:storage_prioritas_1_dan_2/page/contact_page.dart';
import 'package:storage_prioritas_1_dan_2/utils/shared_preference.dart';
import 'package:storage_prioritas_1_dan_2/widget/text_field_widget.dart';

class HalamanLogin extends StatefulWidget {
  const HalamanLogin({super.key});

  @override
  State<HalamanLogin> createState() => _FormLoginPageState();
}

class _FormLoginPageState extends State<HalamanLogin> {
  final _usernameController = TextEditingController();
  final _passwrodController = TextEditingController();

  String usernameValue = "";
  String passwordValue = "";

  @override
  void dispose() {
    _usernameController.dispose();
    _passwrodController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFieldWidget(
              label: "Username",
              hintText: "Masukkan username",
              onChanged: (val) {
                setState(() {
                  usernameValue = val;
                });
              },
              controller: _usernameController,
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 10),
            TextFieldWidget(
              label: "Password",
              hintText: "Masukkan password",
              onChanged: (val) {
                setState(() {
                  passwordValue = val;
                });
              },
              controller: _passwrodController,
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await SharedPreference().simpanUsername(usernameValue);
                await SharedPreference().simpanPassword(passwordValue);

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ContactPage(),
                  ),
                );
              },
              child: const Text("Login"),
            )
            // ElevatedButton(
            //   onPressed: () async {
            //     await SharedPreference().saveToken(
            //       _nameController.text,
            //     );

            //     Navigator.pushReplacement(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => const HalamanHome(),
            //       ),
            //     );
            //   },
            //   child: const Text('Save'),
            // ),
          ],
        ),
      ),
    );
  }
}
