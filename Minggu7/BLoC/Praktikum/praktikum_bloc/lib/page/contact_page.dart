import 'package:flutter/material.dart';
import 'package:praktikum_bloc/page/widget/button_submit_widget.dart';
import 'package:praktikum_bloc/page/widget/field_phone_widget.dart';
import 'package:praktikum_bloc/page/widget/field_username_widget.dart';
import '../theme/theme_color_style.dart';
import '../theme/theme_text_style.dart';
import 'widget/header_contact_page.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  String _nameValue = "";
  String _phoneValue = "";

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  List<Map<String, String>> contacts = [];

  void addContact() {
    if (_nameValue.isNotEmpty && _phoneValue.isNotEmpty) {
      contacts.add({"title": _nameValue, "subtitle": _phoneValue});
      setState(() {
        _nameValue = "";
        _phoneValue = "";
      });
      // ignore: avoid_print
      print(contacts);
      _nameController.clear();
      _phoneController.clear();
    }
  }

  int selectedIndex = -1;

  void updateContact(int index) {
    if (_nameValue.isNotEmpty && _phoneValue.isNotEmpty) {
      contacts[index]["title"] = _nameValue;
      contacts[index]["subtitle"] = _phoneValue;
      setState(() {
        _nameValue = "";
        _phoneValue = "";
      });
      selectedIndex = -1;
      _nameController.clear();
      _phoneController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 236, 167, 248),
        title: Text(
          "Contact",
          style: ThemeTextStyle().m3DisplayLarge,
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const HeaderContactPage(),
          const FieldUsernameWidget(),
          const SizedBox(height: 20,),
          const FieldPhoneWidget(),
          const SizedBox(height: 20,),
          const ButtonSubmitWidget(),
          const SizedBox(
            height: 49,
          ),
          Text(
            "List Contact",
            style: ThemeTextStyle().m3HeadLineSmall,
            textAlign: TextAlign.center,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: ThemeColor().m3SysyLightPurple90,
                      child: Text(
                        "A",
                        style: TextStyle(color: ThemeColor().m3SysDarkPurple),
                      ),
                    ),
                    title: Text(
                      contacts[index]["title"] ?? "",
                      style: ThemeTextStyle().m3BodyLarge,
                    ),
                    subtitle: Text(
                      contacts[index]["subtitle"] ?? "",
                      style: ThemeTextStyle().m3BodySmall,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            _nameController.text = contacts[index]["title"]!;
                            _phoneController.text =
                                contacts[index]["subtitle"]!;
                            selectedIndex = index;
                          },
                          icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              contacts.removeAt(index);
                            });
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
