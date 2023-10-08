import 'package:flutter/material.dart';
import 'package:tugas_minggu_ke_5/page/widget/header_contact_page.dart';
import '../theme/theme_color_style.dart';
import '../theme/theme_text_style.dart';
import '../widget/button_widget.dart';
import '../widget/text_field_widget.dart';

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
      setState(() {});
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
          TextFieldWidget(
            label: "Name",
            hintText: "Insert Your Name",
            onChanged: (val) {
              _nameValue = val;
              setState(() {});
              // ignore: avoid_print
              print(_nameValue);
            },
            controller: _nameController,
            keyboardType: TextInputType.text,
          ),
          TextFieldWidget(
            label: "Nomor",
            hintText: "+62 ....",
            onChanged: (val) {
              _phoneValue = val;
              setState(() {});
              // ignore: avoid_print
              print(_phoneValue);
            },
            controller: _phoneController,
            keyboardType: TextInputType.number,
          ),
          ButtonWidget(
            title: "Submit",
            onPressed: _nameValue.isNotEmpty && _phoneValue.isNotEmpty
                ? () {
                    if (selectedIndex == -1) {
                      addContact();
                    } else {
                      updateContact(selectedIndex);
                    }
                  }
                : null,
          ),
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
