// SOAL PRIORITAS 1 (1)

import 'package:flutter/material.dart';

class Prioritas1 extends StatelessWidget {
  const Prioritas1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("MaterialApp"),
        ),
        drawer: Drawer(
          child: ListView(
            children: const <Widget>[
              SizedBox(
                height: 50,
                child: DrawerHeader(
                  child: Text("Home"),
                ),
              ),
              ListTile(
                title: Text("Settings"), // Teks "Setting" di dalam drawer
              ),
            ],
          ),
        ),
        body: const Center(child: Text("This is MeterialApp")),
        bottomNavigationBar:
            BottomNavigationBar(items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Config")
        ]),
      ),
    );
  }
}
