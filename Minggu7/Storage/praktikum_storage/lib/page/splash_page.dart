import 'package:flutter/material.dart';
import 'package:storage_prioritas_1_dan_2/page/contact_page.dart';
import '../utils/shared_preference.dart';
import 'login_page.dart';

class HalamanSplash extends StatefulWidget {
  const HalamanSplash({super.key});

  @override
  State<HalamanSplash> createState() => _HalamanSplashState();
}

class _HalamanSplashState extends State<HalamanSplash> {
  void checkLogin() async {
    String username = await SharedPreference().readUsername();
    String password =await SharedPreference().readPassword();

    Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () {
        if (username.isNotEmpty && password.isNotEmpty) {
          // homePage
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const ContactPage(),
              ),
              (route) => false);
        } else {
          // login
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HalamanLogin(),
              ),
              (route) => false);
        }
      },
    );
  }

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(
          Icons.cruelty_free_outlined,
          size: 48,
        ),
      ),
    );
  }
}
