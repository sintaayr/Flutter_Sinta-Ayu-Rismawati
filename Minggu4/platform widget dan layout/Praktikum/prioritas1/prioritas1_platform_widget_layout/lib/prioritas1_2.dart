// SOAL PRIORITAS 1 (2)

import 'package:flutter/material.dart';

import 'list_tile_global.dart';

class MyWidget2 extends StatelessWidget {
  const MyWidget2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        backgroundColor: Colors.white,
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
        body: ListView(
          children: const [
            ListTileWidget(
                textAvatar: "A",
                textTitle: "Leanne Graham",
                textSubtitle: "1-770-736-8031 x56442"),
            ListTileWidget(
                textAvatar: "E",
                textTitle: "Ervin Howell",
                textSubtitle: "010-692-6593 x09125"),
            ListTileWidget(
                textAvatar: "C",
                textTitle: "Clementine Bauch",
                textSubtitle: "1-463-123-4447"),
            ListTileWidget(
                textAvatar: "P",
                textTitle: "Patricia Lebsack",
                textSubtitle: "493-170-9623 x156"),
            ListTileWidget(
                textAvatar: "C",
                textTitle: "Chelsey Dietrich",
                textSubtitle: "(254)954-1289)"),
            ListTileWidget(
                textAvatar: "M",
                textTitle: "Mrs.Dennis Schulist",
                textSubtitle: "1-477-935-8478 x6430"),
            ListTileWidget(
                textAvatar: "K",
                textTitle: "Kurtis Weissnat",
                textSubtitle: "210.067.6132")
          ],
        ),
        bottomNavigationBar:
            BottomNavigationBar(items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Config")
        ]),
      ),
    );
  }
}
